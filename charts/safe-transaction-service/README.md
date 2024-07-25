# Safe-Transaction-Service

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/safe-transaction-service)](https://artifacthub.io/packages/search?repo=safe-transaction-service)

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe-transaction-service](https://github.com/safe-global/safe-transaction-service) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

We also package the following helm charts from Bitnami for you to _optionally_ use:

| Chart                                                                        | Descrption                      |
|------------------------------------------------------------------------------|---------------------------------|
| [PostgreSQL](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) | For use as a database           |
| [Redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)           | For enabling caching            |
| [RabbitMQ](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq)     | For use as a message broker     |

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- [Ethereum Node JSON-RPC Endpoint](https://ethereum.org/en/developers/docs/apis/json-rpc/)
- PostgreSQL v14 _(optional)_
- Redis _(optional)_
- RabbitMQ _(optional)_


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-transaction-service \
      --set config.node.url=http://rpc-endpoint 
```

The command deploys safe-transaction-service on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`


## Uninstalling the Chart

To uninstall the `[RELEASE-NAME]` deployment:

```bash
helm uninstall [RELEASE-NAME]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Upgrading Chart

To upgrade the `[RELEASE-NAME]` deployment with the latest version:

```bash
helm upgrade [RELEASE_NAME] safe/safe-transaction-service
```

## Configuration

The following table lists the configurable parameters of the nextcloud chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe/safe-transaction-service
```

| Parameter                                   | Description                                                           | Default                                                                                                          |
|---------------------------------------------|-----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| nameOverride                                | Provide a name in place of safe-transaction-service for `app:` labels | ""                                                                                                               |
| fullnameOverride                            | Provide a name to substitute for the full names of resources          | ""                                                                                                               |
| imagePullSecrets                            | Reference to one or more secrets to be used when pulling images       | ""                                                                                                               |
| replicaCount                                | Number of instance for safe-transaction-service-web                   | 1                                                                                                                |
| image.repository                            | safe-transaction-service image name                                   | safeglobal/safe-transaction-service                                                                              |
| image.tag                                   | safe-transaction-service image tag                                    | latest                                                                                                           |
| image.pullPolicy                            | Image pull policy                                                     | Always                                                                                                           |
| extraEnv                                    | Specify additional environment variables                              | []                                                                                                               |
| config.debug                                | Enable debug mode                                                     | true                                                                                                             |
| config.queues                               | Worker queues to enabled                                              | default,indexing,contracts,tokens,notifications,webhooks                                                         |
| config.secretKey                            | Django secret key                                                     | ""                                                                                                               |
| config.csrf.trustedOrigins                  | Trusted origins should refer to safe-wallet-web URL                   | ""                                                                                                               |
| config.node.url                             | URL of the Ethereum RPC endpoint                                      | ""                                                                                                               |
| config.node.useGanacheNode                  | Specify if you want to use a testing Ganache node                     | false                                                                                                            |
| config.database.runMigration                | Run Database migration on startup                                     | true                                                                                                             |
| config.database.useExisting                 | Use an existing PostgreSQL instance (or spin up one)                  | false                                                                                                            |
| config.database.url                         | Database Url (plsql://...) when config.database.useExisting=true      | ""                                                                                                               |
| config.database.port                        | Database port when config.database.useExisting=false                  | 5432                                                                                                             |
| config.database.user                        | Database username when config.database.useExisting=false              | postgres                                                                                                         |
| config.database.password                    | Database password when config.database.useExisting=false              | postgres                                                                                                         |
| config.database.db                          | Database name when config.database.useExisting=false                  | txs                                                                                                              |
| config.database.persistence.storageClass    | Database persistence class when config.database.useExisting=false     | standard                                                                                                         |
| config.database.persistence.size            | Database persistence size when config.database.useExisting=false      | 100Mi                                                                                                            |
| config.redis.useExisting                    | Use an existing Redis instance (or spin up one)                       | false                                                                                                            |
| config.redis.url                            | Redis Url (redis://...) when config.redis.useExisting=true            | ""                                                                                                               |
| config.rabbitmq.useExisting                 | Use an existing RabbitMQ instance (or spin up one)                    | false                                                                                                            |
| config.rabbitmq.url                         | RabbitMQ Url (amqp://...) when config.rabbitmq.useExisting=true       | ""                                                                                                               |
| config.rabbitmq.username                    | RabbitMQ username when config.rabbitmq.useExisting=false              | guest                                                                                                            |
| config.rabbitmq.password                    | RabbitMQ password when config.rabbitmq.useExisting=false              | guest                                                                                                            |
| config.admin.auth.enabled                   | Autoconfigure Django admin panel on startup                           | true                                                                                                             |
| config.admin.auth.username                  | Django admin panel username                                           | root                                                                                                             |
| config.admin.auth.password                  | Django admin panel password                                           | root123                                                                                                          |
| config.admin.auth.email                     | Django admin panel email                                              | root@example.com                                                                                                 |
| scheduler.nodeSelector                      |                                                                       | {}                                                                                                               |
| scheduler.affinity                          |                                                                       | {}                                                                                                               |
| scheduler.tolerations                       |                                                                       | {}                                                                                                               |
| scheduler.securityContext                   |                                                                       | {}                                                                                                               |
| scheduler.podSecurityContext                |                                                                       | {}                                                                                                               |
| scheduler.resources                         |                                                                       | {}                                                                                                               |
| indexer.nodeSelector                        |                                                                       | {}                                                                                                               |
| indexer.affinity                            |                                                                       | {}                                                                                                               |
| indexer.tolerations                         |                                                                       | {}                                                                                                               |
| indexer.securityContext                     |                                                                       | {}                                                                                                               |
| indexer.podSecurityContext                  |                                                                       | {}                                                                                                               |
| indexer.resources                           |                                                                       | {}                                                                                                               |
| web.nodeSelector                            |                                                                       | {}                                                                                                               |
| web.affinity                                |                                                                       | {}                                                                                                               |
| web.tolerations                             |                                                                       | {}                                                                                                               |
| web.securityContext                         |                                                                       | {}                                                                                                               |
| web.podSecurityContext                      |                                                                       | {}                                                                                                               |
| web.resources                               |                                                                       | {}                                                                                                               |
| ingress.enabled                             | Enable ingress                                                        | true                                                                                                             |
| ingress.ingressClassName                    | Ingress class name                                                    | nginx                                                                                                            |
| ingress.host                                | Ingress host                                                          | txs-service.minikube.net                                                                                         |
| ingress.annotations                         | Ingress annotations                                                   | nginx.ingress.kubernetes.io/force-ssl-redirect :  "true"      nginx.ingress.kubernetes.io/enable-cors :  "false" |
| ganacheNode.enabled                         | Enable a Ganache (testing) node                                       | true                                                                                                             |
| ganacheNode.config.mnemonic                 | Ganache mnemonic used to deploy Safe contracts                        | "test test test test test test test test test test test junk"                                                    |
| ganacheNode.config.chainId                  | Ganache Chain ID                                                      | 1337                                                                                                             |
| ganacheNode.config.persistence.storageClass | Ganache persistence class                                             | standard                                                                                                         |
| ganacheNode.config.persistence.size         | Ganache persistence size                                              | 100Mi                                                                                                            |
| ganacheNode.ingress.enabled                 | Enable ingress to expose the node                                     | true                                                                                                             |
| ganacheNode.ingress.ingressClassName        | Node ingress class                                                    | nginx                                                                                                            |
| ganacheNode.ingress.host                    | Node ingress host                                                     | node.minikube.net                                                                                                |
| ganacheNode.ingress.annotations             | Node ingress annotation                                               | {}                                                                                                               |
|                                             |                                                                       |                                                                                                                  |

---

## Troubleshooting

- 
