
# Changelog

## [0.5.0] - 2023-04-05

### Changed

- Default inspector helm resource memory (memory: 512Mi)
- Bumped container versions
  - `0.5.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.5.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.5.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.5.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.4.0] - 2023-03-24

### Added

- `controlnode.logLevel` to change the controlnode log level (default="2") [0 = DEBUG, 1=INFO, 2=NOTICE, 3=WARN, 4=ERROR]
- `controlnode.logFormat` to change the controlnode log format (default="text-basic") ["text-basic", "json"]
- `inspector.logLevel` to change the inspector log level (default="2") [0 = DEBUG, 1=INFO, 2=NOTICE, 3=WARN, 4=ERROR]
- `inspector.logFormat` to change the inspector log format (default="text-basic") ["text-basic", "json"]
- `webhookinjector.logLevel` to change the webhook injector log level (default="2") [0 = DEBUG, 1=INFO, 2=NOTICE, 3=WARN, 4=ERROR]
- `webhookinjector.logFormat` to change the webhook injector log format (default="text-basic") ["text-basic", "json"]

### Changed

- Bumped container versions
  - `0.4.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.4.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.4.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.4.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.3.0] - 2023-03-09

### Added

- `proxyinit.enabled` allows disabling proxyinit container (default: true)
- `inspector.mode` allows changing the inspector mode (default: "sidecar_proxy")
- `inspector.tcp_listen_addr` allows changing the tcp listener port (default: ":20210")

### Changed

- Default inspector helm resource cpu (requests: 300m limit: 2)
- `pullPolicy: IfNotPresent` set as the default for all containers
- Bumped container versions
  - `0.3.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.3.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.3.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.3.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.2.0] - 2023-02-07

### Added

- `inspector.sigtermDelaySeconds: 20` to chart values. The number of seconds to wait after the Inspector received a sigterm before shutting down; default is 20 seconds. This allows time for the pod to be deregistered from the load balancer and for existing connections finish. More information on k8s graceful shutdown:

  - https://learnk8s.io/graceful-shutdown
  - https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-terminating-with-grace
  - https://easoncao.com/zero-downtime-deployment-when-using-alb-ingress-controller-on-amazon-eks-and-prevent-502-error/

### Changed

- Bumped container versions
  - `0.2.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.2.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.2.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.2.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.1.0] - 2022-09-15

### Added

- Initial release
- Container versions
  - `alpha` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `alpha` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `alpha` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `alpha` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)
