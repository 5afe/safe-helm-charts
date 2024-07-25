# Safe-Config-Service

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/safe-config-service)](https://artifacthub.io/packages/search?repo=safe-config-service)

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe-config-service](https://github.com/safe-global/safe-config-service) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

We also package the following helm charts from Bitnami for you to _optionally_ use:

| Chart                                                                        | Descrption                      |
|------------------------------------------------------------------------------|---------------------------------|
| [PostgreSQL](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) | For use as a database           |

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- PostgreSQL v14 _(optional)_


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-config-service
```

The command deploys nextcloud on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`


## Uninstalling the Chart

To uninstall/delete the `[RELEASE-NAME]` deployment:

```bash
helm delete [RELEASE-NAME]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Upgrading Chart

To upgrade the `[RELEASE-NAME]` deployment with the latest version:

```bash
helm upgrade [RELEASE_NAME] safe/safe-config-service
```

## Configuration

The following table lists the configurable parameters of the nextcloud chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe-config-service
```

| Parameter                                   | Description                                                           | Default                                                                                                          |
|---------------------------------------------|-----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| nameOverride                                | Provide a name in place of safe-config-service for `app:` labels | ""                                                                                                               |
| fullnameOverride                            | Provide a name to substitute for the full names of resources          | ""                                                                                                               |
| imagePullSecrets                            | Reference to one or more secrets to be used when pulling images       | ""                                                                                                               |
| replicaCount                                | Number of instance for safe-config-service-web                   | 1                                                                                                                |
| image.repository                            | safe-config-service image name                                   | safeglobal/safe-config-service                                                                              |
| image.tag                                   | safe-config-service image tag                                    | latest                                                                                                           |
| image.pullPolicy                            | Image pull policy                                                     | Always                                                                                                           |
| extraEnv                                    | Specify additional environment variables                              | []                                                                                                               |
| config.debug                                | Enable debug mode                                                     | true                                                                                                             |
| config.secretKey                            | Django secret key                                                     | ""                                                                                                               |
| config.csrf.trustedOrigins                  | Trusted origins should refer to safe-wallet-web URL                   | ""                                                                                                               |
| config.clientGateway.url                    | URL of the Client-Gateway                                             | ""                                                                                                               |
| config.clientGateway.token                  | Client-Gateway flush token                                            | ""                                                                                                               |
| config.database.runMigration                | Run Database migration on startup                                     | true                                                                                                             |
| config.database.useExisting                 | Use an existing PostgreSQL instance (or spin up one)                  | false                                                                                                            |
| config.database.url                         | Database Url (plsql://...) when config.database.useExisting=true      | ""                                                                                                               |
| config.database.port                        | Database port when config.database.useExisting=false                  | 5432                                                                                                             |
| config.database.user                        | Database username when config.database.useExisting=false              | postgres                                                                                                         |
| config.database.password                    | Database password when config.database.useExisting=false              | postgres                                                                                                         |
| config.database.db                          | Database name when config.database.useExisting=false                  | cfg                                                                                                              |
| config.database.persistence.storageClass    | Database persistence class when config.database.useExisting=false     | standard                                                                                                         |
| config.database.persistence.size            | Database persistence size when config.database.useExisting=false      | 100Mi                                                                                                            |
| config.admin.auth.enabled                   | Autoconfigure Django admin panel on startup                           | true                                                                                                             |
| config.admin.auth.username                  | Django admin panel username                                           | root                                                                                                             |
| config.admin.auth.password                  | Django admin panel password                                           | root123                                                                                                          |
| config.admin.auth.email                     | Django admin panel email                                              | root@example.com                                                                                                 |
| web.nodeSelector                            |                                                                       | {}                                                                                                               |
| web.affinity                                |                                                                       | {}                                                                                                               |
| web.tolerations                             |                                                                       | {}                                                                                                               |
| web.securityContext                         |                                                                       | {}                                                                                                               |
| web.podSecurityContext                      |                                                                       | {}                                                                                                               |
| web.resources                               |                                                                       | {}                                                                                                               |
| ingress.enabled                             | Enable ingress                                                        | true                                                                                                             |
| ingress.ingressClassName                    | Ingress class name                                                    | nginx                                                                                                            |
| ingress.host                                | Ingress host                                                          | cfg-service.minikube.net                                                                                         |
| ingress.annotations                         | Ingress annotations                                                   | nginx.ingress.kubernetes.io/force-ssl-redirect :  "true"      nginx.ingress.kubernetes.io/enable-cors :  "false" |
|                                             |                                                                       |                                                                                                                  |


## Troubleshooting

- 