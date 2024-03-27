
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

## Annotations

| Annotation Name                                                | Description                                                                                                                      |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| <nobr>impart-inspector-sidecar-http-listener-disable-tls<nobr> | Listens and serves http. "true" or "false" string values                                                                         |
| <nobr>impart-inspector-sidecar-container-backend-scheme<nobr>  | Overrides http or https backend scheme. Typical scenario when inspector termanates ssl and pushes traffic into http backed port. |
| <nobr>impart-inspector-sidecar-tls-secret<nobr>                | Sets kubernetes ssl secret.                                                                                                      |
| <nobr>impart-inspector-plugin-mode<nobr>                       | Installs inspector without intercepting the traffic. Requires a plugin to interact with the inspector. Values "tcp" - sets insepctor mode to tcp_server, "socket" - sets inspector mode to unix_socket_server, "socket+volume" - sets inspector mode to unix_socket_server and creates and mounts socket volume.                        |

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
