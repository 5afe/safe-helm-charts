{{/*
Expand the name of the chart.
*/}}
{{- define "safe-transaction-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "safe-transaction-service.fullname" -}}
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
{{- define "safe-transaction-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "safe-transaction-service.labels" -}}
helm.sh/chart: {{ include "safe-transaction-service.chart" . }}
{{ include "safe-transaction-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "safe-transaction-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "safe-transaction-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create a default fully qualified app name for postgresql
*/}}
{{- define "safe-transaction-service.postgresql.fullname" -}}
{{- if index .Values "safe-transaction-service-postgresql" "fullnameOverride" }}
{{- index .Values "safe-transaction-service-postgresql" "fullnameOverride" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $suffix := "safe-transaction-service-postgresql" }}
{{- printf "%s-%s" .Release.Name $suffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for redis
*/}}
{{- define "safe-transaction-service.redis.fullname" -}}
{{- if index .Values "safe-transaction-service-redis" "fullnameOverride" }}
{{- index .Values "safe-transaction-service-redis" "fullnameOverride" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $suffix := "safe-transaction-service-redis" }}
{{- printf "%s-%s" .Release.Name $suffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for rabbitmq
*/}}
{{- define "safe-transaction-service.rabbitmq.fullname" -}}
{{- if index .Values "safe-transaction-service-rabbitmq" "fullnameOverride" }}
{{- index .Values "safe-transaction-service-rabbitmq" "fullnameOverride"  | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $suffix := "safe-transaction-service-rabbitmq" }}
{{- printf "%s-%s" .Release.Name $suffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}