{{/*
Expand the name of the chart.
*/}}
{{- define "sidecar-injector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sidecar-injector.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sidecar-injector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sidecar-injector.labels" -}}
helm.sh/chart: {{ include "sidecar-injector.chart" . }}
{{ include "sidecar-injector.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sidecar-injector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sidecar-injector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sidecar-injector.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sidecar-injector.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified component name from the full app name and a component name.
We truncate the full name at 63 - 1 (last dash) - len(component name) chars because some Kubernetes name fields are limited to this (by the DNS naming spec)
and we want to make sure that the component is included in the name.
*/}}
{{- define "sidecar-injector.componentname" -}}
{{- $global := index . 0 -}}
{{- $component := index . 1 | trimPrefix "-" -}}
{{- printf "%s-%s" (include "sidecar-injector.fullname" $global | trunc (sub 62 (len $component) | int) | trimSuffix "-" ) $component | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the certificate secret to use
*/}}
{{- define "sidecar-injector.certificateSecretName" -}}
{{- default (include "sidecar-injector.componentname" (list . "webhook-tls")) .Values.certificate.secretName }}
{{- end }}
