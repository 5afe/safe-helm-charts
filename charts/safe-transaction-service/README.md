# Safe-Transaction-Service

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
helm upgrade [RELEASE-NAME] safe/safe-transaction-service
```

## Configuration

The following table lists the configurable parameters of the safe-transaction-service chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe/safe-transaction-service
```

### Common parameters

| Parameter | Description | Default |
|---|---|---|
| `nameOverride` | Provide a name in place of safe-transaction-service for `app:` labels | `""` |
| `fullnameOverride` | Provide a name to substitute for the full names of resources | `""` |

### Installation parameters

| Parameter | Description | Default |
|---|---|---|
| `replicaCount` | Number of instance for safe-transaction-service-web | `1` |
| `image.repository` | safe-transaction-service image name | `safeglobal/safe-transaction-service` |
| `image.tag` | safe-transaction-service image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `Always` |
| `extraEnv` | Specify additional environment variables | `[]` |

### Configuration parameters

| Parameter | Description | Default |
|---|---|---|
| `config.debug` | Enable debug mode | `true` |
| `config.queues` | Worker queues to enabled | `default,indexing,contracts,tokens,notifications,webhooks` |
| `config.secretKey` | Django secret key | `""` |
| `config.csrf.trustedOrigins` | Trusted origins should refer to safe-wallet-web URL | `""` |
| `config.node.url` | URL of the Ethereum RPC endpoint | `""` |
| `config.node.useGanacheNode` | Specify if you want to use a testing Ganache node | `false` |
| `config.database.runMigration` | Run Database migration on startup | `true` |
| `config.database.url` | Database URL<br>if `safe-transaction-service-postgresql.enabled=false`<br>e.g `plsql://user:pw@host:port/db` | `""` |
| `config.redis.url` | Redis URL<br>if `safe-transaction-service-redis.enabled=false`<br>e.g `redis://user:pw@host:port/0` | `""` |
| `config.rabbitmq.url` | RabbitMQ URL<br>if `safe-transaction-service-rabbitmq.enabled=false`<br>e.g `amqp://` | `""` |
| `config.admin.auth.enabled` | Autoconfigure Django admin panel on startup | `true` |
| `config.admin.auth.username` | Django admin panel username | `root` |
| `config.admin.auth.password` | Django admin panel password | `root123` |
| `config.admin.auth.email` | Django admin panel email | `root@example.com` |

### Pod parameters

| Parameter | Description | Default |
|---|---|---|
| `scheduler.nodeSelector` |  | `{}` |
| `scheduler.affinity` |  | `{}` |
| `scheduler.tolerations` |  | `{}` |
| `scheduler.securityContext` |  | `{}` |
| `scheduler.podSecurityContext` |  | `{}` |
| `scheduler.resources` |  | `{}` |
| `indexer.nodeSelector` |  | `{}` |
| `indexer.affinity` |  | `{}` |
| `indexer.tolerations` |  | `{}` |
| `indexer.securityContext` |  | `{}` |
| `indexer.podSecurityContext` |  | `{}` |
| `indexer.resources` |  | `{}` |
| `web.nodeSelector` |  | `{}` |
| `web.affinity` |  | `{}` |
| `web.tolerations` |  | `{}` |
| `web.securityContext` |  | `{}` |
| `web.podSecurityContext` |  | `{}` |
| `web.resources` |  | `{}` |

### Ingress parameters

| Parameter | Description | Default |
|---|---|---|
| `ingress.enabled` | Enable ingress | `true` |
| `ingress.ingressClassName` | Ingress class name | `nginx` |
| `ingress.host` | Ingress host | `txs-service.minikube.net` |
| `ingress.annotations` | Ingress annotations | <pre>nginx.ingress.kubernetes.io/force-ssl-redirect: "true"<br>nginx.ingress.kubernetes.io/enable-cors: "false"</pre> |

### Ganache (testing node) parameters

| Parameter | Description | Default |
|---|---|---|
| `ganacheNode.enabled` | Enable a Ganache (testing) node | `true` |
| `ganacheNode.config.mnemonic` | Ganache mnemonic used to deploy Safe contracts | `"test test test test test test test test test test test junk"` |
| `ganacheNode.config.chainId` | Ganache Chain ID | `1337` |
| `ganacheNode.config.deterministicDeployment` | Use deterministic deployment (if `safe-singleton-factory` available) | `true` |
| `ganacheNode.config.persistence.storageClass` | Ganache persistence class | `standard` |
| `ganacheNode.config.persistence.size` | Ganache persistence size | `100Mi` |
| `ganacheNode.ingress.enabled` | Enable ingress to expose the node | `true` |
| `ganacheNode.ingress.ingressClassName` | Node ingress class | `nginx` |
| `ganacheNode.ingress.host` | Node ingress host | `node.minikube.net` |
| `ganacheNode.ingress.annotations` | Node ingress annotation | `{}` |

### Database parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-transaction-service-postgresql.enabled` | Spin up a PostgreSQL instance | `true` |

Refer to [bitnami/postgresql](https://artifacthub.io/packages/helm/bitnami/postgresql) for configuration.

### Redis parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-transaction-service-redis.enabled` | Spin up a Redis instance | `true` |

Refer to [bitnami/redis](https://artifacthub.io/packages/helm/bitnami/redis) for configuration.

### RabbitMQ parameters

| Parameter | Description | Default |
|---|---|---|
| `safe-transaction-service-rabbitMQ.enabled` | Spin up a RabbitMQ instance | `true` |

Refer to [bitnami/rabbitmq](https://artifacthub.io/packages/helm/bitnami/rabbitmq) for configuration.


## Troubleshooting

- 
