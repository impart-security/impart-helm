# impart

Helm chart to automatically install impart proxy inspector

## Installing the Chart

```console
$ kubectl create secret generic <tls-secret> --from-file=tls.key=/path/to/tls.key --from-file=tls.crt=/path/to/tls.crt --from-file=ca.crt=/path/to/ca.crt

$ helm install impart ./charts/sidecar-injector --set inspector.tlsSecret=<tls-secret>
```
to inject inspector into an api pod provide the following annotations
```yaml
spec:
  template:
    metadata:
      impart-inspector-injection: "enabled"
      impart-inspector-sidecar-target-url: "https://localhost:<api-port>"
```

## Uninstalling the Chart

```console
$ helm delete impart
```
