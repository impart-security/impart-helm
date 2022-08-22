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
$ helm install --namespace impart impart impart/sidecar-injector --set inspector.tlsSecret=<tls-secret> --set inspector.auth.accessToken=<accessToken>
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
