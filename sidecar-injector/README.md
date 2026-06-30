
# impart

Helm chart to automatically install impart proxy inspector

## Installing the Chart

Create deployment namespace

```console
$ kubectl create namespace impart
```

Create ssl secret for inspector to be able to intercept traffic. Note the secret should be in the api deployment namespace

```console
$ kubectl create -n <api_pod_deployment_ns> secret generic <tls-secret> --from-file=tls.key=/path/to/tls.key --from-file=tls.crt=/path/to/tls.crt --from-file=ca.crt=/path/to/ca.crt
```

Create access token in console and create secret with `accessToken` entry in the pod namespace

Install helm chart

```console
$ helm repo add impart https://helm.impartsecurity.net
$ helm repo update
$ helm install --namespace impart impart impart/sidecar-injector --set inspector.tlsSecret=<tls-secret> --set inspector.auth.accessTokenSecretRef=<accessTokenSecretName>
```

to inject inspector into an api pod provide the following annotations

```yaml
spec:
  template:
    metadata:
      labels:
        impart-inspector-injection: "enabled"
```

## Uninstalling the Chart

```console
$ helm delete impart
```

### Client-hash seed retention

When `inspector.clientHashSeed.autoGenerate` is enabled, the injector creates
client-hash seed `Secret`s imperatively (the source in the release namespace and
a copy in each injected namespace), so `helm uninstall` does **not** remove them.
This is intentional: the seed keys all historical attacker correlation, and
keeping it lets a reinstall continue that correlation. To remove the seeds, either
set `inspector.clientHashSeed.purgeOnUninstall: true` before uninstalling (installs
a `pre-delete` hook that purges **this release's** seeds — it is scoped by the
`app.kubernetes.io/instance` label, so it never touches another injector release's
seeds), or delete them manually:

```console
# this release's seeds only (recommended)
$ kubectl delete secret -l impart.security/client-hash-seed=true,app.kubernetes.io/managed-by=impart-sidecar-injector,app.kubernetes.io/instance=<release> --all-namespaces
# every release's seeds (drop the instance label)
$ kubectl delete secret -l impart.security/client-hash-seed=true,app.kubernetes.io/managed-by=impart-sidecar-injector --all-namespaces
```

### Rotating the client-hash seed

Rotation is a deliberate, manual operation — the injector never rotates the seed on
its own. **Rotating re-pseudonymizes every hash, so it breaks correlation with all
pre-rotation attacker data.** Only rotate if the seed is believed compromised or you
explicitly want a clean break.

Three things resist a value change by design, and each step below addresses one: the
source is never overwritten (and is cached in the injector's memory for its lifetime),
per-namespace copies are never overwritten (and error on value divergence), and a
running pod reads its seed from env only at startup.

```console
# 1a. Set a specific new source value (in the release namespace). `apply` overwrites
#     the existing source Secret — the injector itself never overwrites it.
$ kubectl -n <release-ns> create secret generic impart-client-hash-seed \
    --from-literal=clientHashSeed=<new-seed> \
    --dry-run=client -o yaml | kubectl apply -f -
# 1b. ...or let the injector generate a fresh random value: delete the source Secret
#     so it is recreated (get-or-create) on the injector restart in step 2.
$ kubectl -n <release-ns> delete secret impart-client-hash-seed

# 2. Restart the injector so it drops the cached old source and reads the new one.
$ kubectl -n <release-ns> rollout restart deploy/<release>-sidecar-injector

# 3. Delete the per-namespace COPIES (every injected namespace EXCEPT the release
#    namespace, so the source is preserved) so they are recreated from the new source.
$ kubectl delete secret impart-client-hash-seed -n <app-ns>   # repeat per namespace

# 4. Rolling-restart injected workloads so new pods pick up the new copy.
$ kubectl -n <app-ns> rollout restart deploy/<app>            # repeat per workload
```

Until steps 3–4 are done for a namespace, its pods keep using the old seed and the
injector logs a divergence warning on each admission there — that warning is the
signal that a copy is stale, not an error that blocks anything.

## Annotations

The sidecar injector supports the following annotations for customizing inspector behavior on a per-pod basis:

| Annotation Name | Description | Type | Example/Values |
|-----------------|-------------|------|----------------|
| `impart-inspector-sidecar-container-backend-scheme` | Overrides http or https backend scheme. Used when inspector terminates SSL and forwards to HTTP backend | string | `http`, `https` |
| `impart-inspector-sidecar-http-listener-disable-tls` | Disables TLS on the HTTP listener, serves plain HTTP | boolean string | `"true"`, `"false"` |
| `impart-inspector-sidecar-destination-addr` | Override destination address for the sidecar | string | `localhost:8080` |
| `impart-inspector-grpc-listen-addr` | gRPC listener address for external processing | string | `:20212` |
| `impart-inspector-grpc-extproc-max-body-size` | Maximum body size for gRPC external processing | string | `1048576` |
| `impart-inspector-mode` | Sets the inspector operation mode | string | `grpc_server` |
| `impart-inspector-image` | Override the inspector container image | string | `impart/inspector:v1.2.3` |
| `impart-tcp-listen-addr` | TCP listener address | string | `:8080` |
| `impart-inspector-cluster-group` | Cluster group identifier for grouping related services | string | `production-cluster` |
| `impart-inspector-logstream-id` | Log stream identifier for centralized logging | string | `app-logs-123` |
| `impart-inspector-logstream-log-tail-file` | File path for log tailing | string | `/var/log/app.log` |
| `impart-inspector-sidecar-tls-secret` | Kubernetes secret name containing TLS certificates | string | `my-tls-secret` |
| `impart-inspector-access-token-secret` | Kubernetes secret name containing the Impart access token | string | `impart-access-token` |
| `impart-proxy-init-enabled` | Enables the proxy init container for traffic interception | boolean string | `"true"`, `"false"` |
| `impart-inspector-plugin-mode` | Configures inspector for plugin-based operation without traffic interception | string | `tcp`, `socket`, `socket+volume` |
| `impart-inspector-extra-env` | Additional environment variables for the inspector container as JSON/YAML array | JSON/YAML array | `[{"name":"DEBUG","value":"true"}]` |
| `impart-inspector-sidecar-config` | Complete inspector configuration as JSON/YAML object, allows overriding all settings defined in helm values for inspector | JSON/YAML object | See detailed examples below |

### Special Annotation Formats

**Proxy Configuration (`impart-inspector-sidecar-config`)**

The `impart-inspector-sidecar-config` annotation allows you to provide a complete inspector configuration as either JSON or YAML.

**JSON Example:**
```yaml
annotations:
  impart-inspector-sidecar-config: |
    {
      "mode": "sidecar_proxy",
      "logLevel": "debug",
      "port": 14143,
      "resources": {
        "limits": {
          "cpu": "2",
          "memory": "4Gi"
        },
        "requests": {
          "cpu": "500m",
          "memory": "1Gi"
        }
      }
    }
```

**YAML Example:**
```yaml
annotations:
  impart-inspector-sidecar-config: |
    mode: sidecar_proxy
    logLevel: debug
    port: 14143
    resources:
      limits:
        cpu: "2"
        memory: "4Gi"
      requests:
        cpu: "500m"
        memory: "1Gi"
```

**Priority and Override Behavior:**
1. **Proxy config takes precedence** over default Helm values
2. **Individual annotations can still override** proxy config values for maximum flexibility
3. **Individual annotations are processed after** proxy config, allowing fine-tuning

**Extra Environment Variables (`impart-inspector-extra-env`)**

Accepts a JSON or YAML array of environment variable objects. **Note: Only new environment variables are added - existing ones will not be overridden to prevent breaking core inspector functionality.**

**JSON Format:**
```yaml
annotations:
  impart-inspector-extra-env: |
    [
      {"name": "DEBUG", "value": "true"},
      {"name": "CUSTOM_CONFIG", "value": "production"},
      {"name": "LOG_LEVEL", "value": "info"}
    ]
```

**YAML Format:**
```yaml
annotations:
  impart-inspector-extra-env: |
    - name: DEBUG
      value: "true"
    - name: SECRET_VAR
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: password
    - name: CUSTOM_CONFIG
      value: production
```

Each environment variable object must have:
- `name` (string): The environment variable name
- `value` (string): The environment variable value **OR**
- `valueFrom` (object): Reference to get the value from a secret, configMap, etc.

**Important:** If an environment variable with the same name already exists in the base inspector configuration, it will be skipped to preserve critical functionality.

**Plugin Mode Values (`impart-inspector-plugin-mode`)**

- `tcp`: Sets inspector mode to `tcp_server` for TCP-based plugin communication
- `socket`: Sets inspector mode to `unix_socket_server` for Unix socket communication  
- `socket+volume`: Sets inspector mode to `unix_socket_server` and creates/mounts a socket volume for shared access
- `grpc+socket+volume`: Sets inspector mode to `grpc_server` and creates a socket volume mounted into the injected container **and every other container in the pod** (e.g. the Envoy data-plane container) so they share the socket — for Envoy Gateway ext_proc over a Unix domain socket (no `Backend` loopback restriction, no StrategicMerge patch). The listen address and socket permissions come from the `inspector.grpcListenAddr` (set to a `unix://` URI) and `inspector.grpcUnixSocketPermissions` chart values, mirroring `inspector.unixSocketPath` / `inspector.unixSocketPermissions` for `socket+volume`.

## Installing as nginx ingress sidecar proxy

Install sidecar-injector helm chart but override ignore port values. Set nginx health probe port to exclude from proxying.

```yaml
proxyinit:
  ignorePorts:
    inbound: "8081"
    outbound: "8081"
```

Install nginx-ingress helm chart

```console
$ helm repo add nginx-stable https://helm.nginx.com/stable
$ helm repo update
$ helm install nginx-ingress nginx-stable/nginx-ingress

$ helm install nginx-ingress --namespace <namespace> nginx-stable/nginx-ingress --values nginx-values.yaml
```

Nginx ingress values yaml:

```yaml
controller:
  pod:
    extraLabels:
      impart-internal-inspector-injection: enabled
  volumes:
    - name: tls-secret
      secret:
        secretName: <tls secret from impart chart installation>
```

## Installing as emissary-ingress sidecar proxy

Impart sidecar-injector helm overrides to exclude emissary health port

```yaml
proxyinit:
  ignorePorts:
    inbound: "8877"
    outbound: "8877"
```

If emissary is used with linkerd and linkerd proxy is injected into emissary gateway pod set `proxyIntercept` values.
Adjust `ingressListenPorts` according to emissary crd Listener resources.

```yaml
proxyinit:
  proxyIntercept:
    enabled: true
    ingressListenPorts: "8080,8443"
    userUid: 2102 #uid of service mesh proxy (linkerd default 2102)
```

Create impart access token secret in the emissary installation namespace
```
kubectl create -n emissary secret generic impart-secrets --from-file=accessToken=accessToken.secret
```

Install emissary-ingress

```
helm install -n emissary \
     emissary-ingress datawire/emissary-ingress --values emissary-values.yaml
```

with the overrides file:

```yaml
podAnnotations:
  #uncomment for non-tls traffic
  #impart-inspector-sidecar-container-backend-scheme: http
  #impart-inspector-sidecar-http-listener-disable-tls: "true"

#enable impart proxy injection
podLabels:
  impart-inspector-injection: enabled
```
