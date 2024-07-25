# Safe-Wallet-Web

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/safe-wallet-web)](https://artifacthub.io/packages/search?repo=safe-wallet-web)

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe-wallet-web](https://github.com/safe-global/safe-wallet-web) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- [Safe-transaction-service](../safe-transaction-service/)
- [Safe-config-service](../safe-config-service/)
- [Safe-client-gateway](../safe-client-gateway)


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages

helm install [RELEASE-NAME] safe/safe-wallet-web
```

The command deploys safe-wallet-web on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

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
helm upgrade [RELEASE_NAME] safe/safe-wallet-web
```

## Configuration

The following table lists the configurable parameters of the safe-wallet-web chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe-wallet-web
```

| Parameter                                   | Description                                                           | Default                                                                                                          |
|---------------------------------------------|-----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| nameOverride                                | Provide a name in place of safe-wallet-web for `app:` labels | ""                                                                                                               |
| fullnameOverride                            | Provide a name to substitute for the full names of resources          | ""                                                                                                               |
| imagePullSecrets                            | Reference to one or more secrets to be used when pulling images       | ""                                                                                                               |
| replicaCount                                | Number of instance for safe-wallet-web-web                   | 1                                                                                                                |
| image.repository                            | safe-wallet-web image name                                   | safeglobal/safe-wallet-web                                                                              |
| image.tag                                   | safe-wallet-web image tag                                    | latest                                                                                                           |
| image.pullPolicy                            | Image pull policy                                                     | Always                                                                                                           |
| extraEnv                                    | Specify additional environment variables                              | []                                                                                                               |
| config.clientGateway.url                    | URL of the Client-Gateway                                             | ""                                                                                                               |
| config.walletConnect.projectId              | Wallet-Connect project ID                                             | false                                                                                                            |
| config.walletConnect.bridge                 | Wallet-Connect Bridge                                                 | ""                                                                                                               |
| web.nodeSelector                            |                                                                       | {}                                                                                                               |
| web.affinity                                |                                                                       | {}                                                                                                               |
| web.tolerations                             |                                                                       | {}                                                                                                               |
| web.securityContext                         |                                                                       | {}                                                                                                               |
| web.podSecurityContext                      |                                                                       | {}                                                                                                               |
| web.resources                               |                                                                       | {}                                                                                                               |
| ingress.enabled                             | Enable ingress                                                        | true                                                                                                             |
| ingress.ingressClassName                    | Ingress class name                                                    | nginx                                                                                                            |
| ingress.host                                | Ingress host                                                          | safe-wallet.minikube.net                                                                                         |
| ingress.annotations                         | Ingress annotations                                                   | nginx.ingress.kubernetes.io/force-ssl-redirect :  "true"      nginx.ingress.kubernetes.io/enable-cors :  "false" |
|                                             |                                                                       |                                                                                                                                                                                                                    |


## Troubleshooting

- 