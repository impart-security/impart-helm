# Changelog

## [0.42.7] - 2026-01-15

### Changed

- Support incoming traffic interception on specific ports in the proxy-intercept mode.

## [0.42.6] - 2026-01-05

### Changed

- Bumped container versions
  - `0.42.6` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.42.5] - 2025-12-23

### Changed

- Bumped container versions
  - `0.42.5` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.42.3` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.42.3` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.42.3` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.42.4] - 2025-12-08

### Changed

- Bumped container versions
  - `0.42.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.42.2` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.42.2` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.42.2` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.42.3] - 2025-12-03

### Changed

- Bumped container versions
  - `0.42.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.42.1` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.42.1` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.42.1` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.42.2] - 2025-11-26

### Added

- Custom labels support via `webhookinjector.podLabels` and `webhookinjector.deploymentLabels` for webhook injector deployment and pods.
- Custom labels support via `controlnode.podLabels` and `controlnode.deploymentLabels` for control node deployment and pods.
- Certificate rotator cronjob configuration via new `certrotator` object with `cronJobAnnotations`, `podAnnotations`, `cronJobLabels`, `podLabels`, `resources`, `affinity`, and `tolerations`.

### Changed

- Bumped container versions
  - `0.42.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.42.1] - 2025-11-25

### Changed

- `inspector.ruleWorkersPool` now defaults to `"0"` for automatic pool sizing based on CPU cores, matching inspector release `0.42.0`. Previously defaulted to `40` fixed workers. Set to a positive integer to override with a fixed pool size.
- Bumped container versions
  - `0.42.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.42.0] - 2025-11-17

### Added

- Native sidecar support for inspector via `inspector.nativeSidecar` configuration (requires Kubernetes 1.28+).
- Per-pod native sidecar override via `impart-inspector-native-sidecar` annotation.
- podAnnotations for webhookinjector and controlnode pods.
- TTL for certificate rotator job.

### Changed

- `inspector.metricsUploadEnabled` now defaults to `true`. Inspector metrics will be uploaded to Impart cloud by default. To disable metrics upload, explicitly set this value to `false`.
- Bumped container versions
  - `0.42.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.42.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.42.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.42.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.41.3] - 2025-11-03

### Changed

- Bumped container versions
  - `0.41.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.41.2] - 2025-10-30

### Changed

- Bumped container versions
  - `0.41.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.41.1] - 2025-10-27

### Changed

- Bumped container versions
  - `0.41.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.41.0] - 2025-10-23

### Added

- `inspector.metricsUploadEnabled` setting to enable inspector metrics upload to Impart cloud. Default is `false` but will be changed to `true` in `0.42.0`.

### Changed

- `inspector.gossipEnabled` now defaults to `"false"`. To enable gossip, explicitly set this value to `"true"`.
- Bumped container versions
  - `0.41.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.41.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.41.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.41.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.40.5] - 2025-10-01

### Added

- Annotation `impart-inspector-sidecar-config` support to override inspector config values.

### Deprecated

- Annotation `impart-inspector-proxy-config` (will be removed in a future release). `impart-inspector-sidecar-config` should be used instead.

### Changed

- Bumped container versions
  - `0.40.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.40.4] - 2025-09-24

- Bumped container versions
  - `0.40.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.40.3] - 2025-09-22

### Changed

- Bumped container versions
  - `0.40.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.40.2] - 2025-09-22

### Changed

- Bumped container versions
  - `0.40.1` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.40.1` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.40.1` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.40.1] - 2025-09-19

### Added

- Support for `impart-inspector-extra-env` annotation to add additional environment variables to the inspector container via JSON array format
- Support for `impart-inspector-proxy-config` annotation to provide complete inspector proxy configuration override

### Changed

- Bumped container versions
  - `0.40.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.40.0] - 2025-09-09

### Changed

- Bumped container versions
  - `0.40.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.40.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.40.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.40.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.39.3] - 2025-08-20

### Changed

- Bumped container versions
  - `0.39.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.39.2] - 2025-08-04

### Changed

- Bumped container versions
  - `0.39.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.39.1] - 2025-08-01

### Changed

- Bumped container versions
  - `0.39.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.39.0] - 2025-07-30

### Changed

- Bumped container versions
  - `0.39.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.39.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.39.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.39.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.38.0] - 2025-07-08

### Changed

- Bumped container versions
  - `0.38.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.38.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.38.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.38.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.37.3] - 2025-07-01

### Added

- Webhook failure policy option
- Inspector state cache size option
- Ability to add additional environment variables for the Inspector sidecar

## [0.37.2] - 2025-06-11

### Changed

- Bumped container versions
  - `0.37.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.37.1] - 2025-06-09

### Changed

- Shortened `cert-rotator` to `cr`.
- Bumped container versions
  - `0.37.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.37.0] - 2025-06-09

### Added

- Webhook certificate rotation

### Changed

- Bumped container versions
  - `0.37.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.37.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.37.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.37.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.36.3] - 2025-05-30

### Changed

- Updated HorizontalPodAutoscaler to api version `autoscaling/v2`

## [0.36.2] - 2025-05-28

### Changed

- Bumped container versions
  - `0.36.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.36.1] - 2025-05-27

### Changed

- Bumped container versions
  - `0.36.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.36.0] - 2025-05-20

### Changed

- Bumped container versions
  - `0.36.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.36.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.36.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.36.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.35.4] - 2025-05-16

### Changed

- Bumped container versions
  - `0.35.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.35.3] - 2025-05-07

### Changed

- Bumped container versions
  - `0.35.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.35.2] - 2025-05-06

### Changed

- Bumped container versions
  - `0.35.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.35.1] - 2025-05-06

### Changed

- Bumped container versions
  - `0.35.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.35.0] - 2025-05-05

### Changed

- Bumped container versions
  - `0.35.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.35.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.35.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.35.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.34.7] - 2025-04-06

### Changed

- Bumped container versions
  - `0.34.7` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.6] - 2025-04-03

### Changed

- Bumped container versions
  - `0.34.6` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.5] - 2025-04-02

### Changed

- Bumped container versions
  - `0.34.5` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.4] - 2025-04-02

### Changed

- Bumped container versions
  - `0.34.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.3] - 2025-04-01

### Changed

- Bumped container versions
  - `0.34.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.2] - 2025-03-31

### Changed

- Bumped container versions
  - `0.34.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.34.1] - 2025-03-31

### Changed

- Bumped container versions
  - `0.34.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.34.1` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.34.1` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.34.1` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.34.0] - 2025-03-30

### Changed

- Bumped container versions
  - `0.34.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.34.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.34.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.34.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.33.1] - 2025-02-13

### Changed

- Bumped container versions
  - `0.33.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.33.1` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.33.1` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.33.1` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.33.0] - 2025-02-12

### Changed

- Bumped container versions
  - `0.33.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.33.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.33.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.33.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.32.0] - 2025-01-16

### Changed

- Bumped container versions
  - `0.32.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.32.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.32.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.32.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.31.2] - 2024-01-07

### Changed

- Bumped container versions
  - `0.31.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.31.1] - 2024-12-18

### Changed

- Bumped container versions
  - `0.31.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.31.0] - 2024-12-16

### Changed

- Bumped container versions
  - `0.31.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.31.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.31.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.31.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.30.0] - 2024-10-29

### Changed

- `logFormat` defaults to `json`.
- Bumped container versions
  - `0.30.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.30.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.30.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.30.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.29.0] - 2024-10-02

### Added

- `inspector.statsdAddr` to set statsd address information.

### Changed

- Bumped container versions
  - `0.29.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.29.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.29.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.29.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.28.2] - 2024-08-30

### Changed

- Bumped container versions
  - `0.28.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.28.1] - 2024-08-29

### Changed

- Bumped container versions
  - `0.28.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.28.0] - 2024-08-29

### Changed

- Bumped container versions
  - `0.28.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.28.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.28.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.28.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.27.0] - 2024-08-25

### Changed

- Bumped container versions
  - `0.27.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.27.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.27.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.27.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.26.1] - 2024-08-22

### Changed

- Bumped container versions
  - `0.26.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.26.0] - 2024-08-20

### Changed

- Bumped container versions
  - `0.26.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.26.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.26.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.26.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.25.0] - 2024-07-24

### Changed

- Bumped container versions
  - `0.25.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.25.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.25.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.25.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)
- Updated default value for inspector.unixSocketPath to /var/run/impart/inspector.sock

## [0.24.4] - 2024-07-10

### Changed

- Bumped container versions
  - `0.24.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.24.3] - 2024-07-02

### Changed

- Bumped container versions
  - `0.24.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.24.2] - 2024-06-24

### Changed

- Bumped container versions
  - `0.24.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.24.1] - 2024-06-10

### Changed

- Bumped container versions
  - `0.24.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.24.0] - 2024-06-10

### Changed

- Bumped container versions
  - `0.24.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.24.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.24.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.24.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.23.2] - 2024-06-05

### Changed

- Bumped container versions
  - `0.23.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.23.1] - 2024-06-05

### Changed

- Bumped container versions
  - `0.23.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.23.0] - 2024-06-04

### Changed

- Bumped container versions
  - `0.23.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.23.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.23.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.23.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.22.0] - 2024-06-02

### Added

- `inspector.ruleWorkersPool` to allow tuning default number of wasm instances in the pool. Default 40.

### Changed

- Bumped container versions
  - `0.22.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.22.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.22.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.22.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.21.0] - 2024-06-02

### Changed

- Bumped container versions
  - `0.21.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.21.0] - 2024-05-30

### Added

- `inspector.gossipEnabled` turns on/off the gossip discovery. Default is `true`.

### Changed

- Bumped container versions
  - `0.21.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.21.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.21.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.21.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.20.1] - 2024-05-24

### Changed

- Bumped container versions
  - `0.20.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.20.0] - 2024-05-20

### Changed

- Bumped container versions
  - `0.20.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.20.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.20.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.20.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.19.0] - 2024-05-06

### Changed

- Bumped container versions
  - `0.19.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.19.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.19.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.19.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.18.2] - 2024-04-25

### Changed

- Bumped container versions
  - `0.18.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.18.1] - 2024-04-23

### Changed

- Bumped container versions
  - `0.18.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.18.0] - 2024-04-11

### Changed

- Bumped container versions
  - `0.18.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.18.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.18.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.18.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.17.1] - 2024-04-01

### Changed

- Bumped container versions
  - `0.17.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.17.0] - 2024-03-27

### Changed

- Bumped container versions
  - `0.17.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.17.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.17.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.17.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.16.8] - 2024-03-26

### Fixed

- Fix helm chart separator

## [0.16.7] - 2024-03-26

### Fixed

- Removed duplicate serviceAccountName in pods

## [0.16.6] - 2024-03-25

### Added

- Ability to intercept local service mesh proxy

## [0.16.5] - 2024-03-21

### Changed

- Exposed inspector security context to be set via values

## [0.16.4] - 2024-03-12

### Changed

- Bumped container versions
  - `0.16.4` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.16.3] - 2024-03-04

### Changed

- Bumped container versions
  - `0.16.3` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.16.2] - 2024-02-27

### Changed

- Bumped container versions
  - `0.16.2` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.16.1] - 2024-02-14

### Changed

- Bumped container versions
  - `0.16.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.16.0] - 2024-02-09

### Changed

- Bumped container versions
  - `0.16.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.16.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.16.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.16.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.15.0] - 2024-01-11

### Changed

- Bumped container versions
  - `0.15.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.15.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.15.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.15.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.14.1] - 2023-12-15

### Changed

- Bumped container versions
  - `0.14.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.14.0] - 2023-12-14

### Changed

- Bumped container versions
  - `0.14.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.14.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.14.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.14.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.13.0] - 2023-10-19

### Changed

- Renamed logstream filename annotation to logstream id.
- Bumped container versions
  - `0.13.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.13.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.13.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.13.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.12.0] - 2023-09-05

### Changed

- Bumped container versions
  - `0.12.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.12.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.12.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.12.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.11.0] - 2023-08-29

### Added

- Add ability to override inspector image via annotations

### Changed

- Bumped container versions
  - `0.11.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.11.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.11.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.11.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.10.0] - 2023-07-31

### Changed

- Default inspector helm resource cpu (requests: 200m limit: 1.2)
- Bumped container versions
  - `0.10.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.10.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.10.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.10.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.9.0] - 2023-07-24

### Added

- `impart-inspector-cluster-group` allows overriding the cluster group for the inspector.
- `impart-inspector-access-token-secret` allows overriding the access token secret.

### Changed

- Bumped container versions
  - `0.9.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.9.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.9.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.9.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.8.1] - 2023-07-15

### Changed

- Bumped container versions
  - `0.8.1` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)

## [0.8.0] - 2023-07-14

### Added

- `destininationAddr` allows overriding the destination address.

### Changed

- Bumped container versions
  - `0.8.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.8.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.8.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.8.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.7.0] - 2023-06-20

### Changed

- Bumped container versions
  - `0.7.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.7.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.7.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.7.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

## [0.6.0] - 2023-05-31

### Changed

- Bumped container versions
  - `0.6.0` - [impartsecurity/inspector](https://hub.docker.com/r/impartsecurity/inspector/tags)
  - `0.6.0` - [impartsecurity/control-node](https://hub.docker.com/r/impartsecurity/control-node/tags)
  - `0.6.0` - [impartsecurity/k8s-webhook-injector](https://hub.docker.com/r/impartsecurity/k8s-webhook-injector/tags)
  - `0.6.0` - [impartsecurity/k8s-sidecar-init](https://hub.docker.com/r/impartsecurity/k8s-sidecar-init/tags)

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
