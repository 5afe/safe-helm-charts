# Safe-Stack

[Safe](https://safe.global/) is the leading Web3 Smart-Account infrastructure.

## Introduction

This chart bootstraps a [safe](https://github.com/safe-global/safe-infrastructure) infrastructure deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

We also package the following helm charts from Bitnami for you to _optionally_ use:

| Chart                                                                        | Descrption                      |
|------------------------------------------------------------------------------|---------------------------------|
| [PostgreSQL](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) | For use as a database           |
| [Redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)           | For enabling caching            |
| [RabbitMq](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq)     | For use as a message broker     |

## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- Persistent Volume provisioner support in the underlying infrastructure
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.
- PostgreSQL v14
- Redis
- RabbitMQ 
- Ethereum node


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://xxxxxxxxxxxxxxxxxxxxx
helm install [RELEASE-NAME] safe/safe-stack
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
helm upgrade [RELEASE_NAME] safe/safe-stack
```

## Configuration

The following table lists the configurable parameters of the nextcloud chart and their default values.

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments:

```bash
helm show values safe/safe-stack
```


| Parameter                                                  | Description                                                                                         | Default                    |
|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|----------------------------|
| `image.repository`                                         | nextcloud Image name                                                                                | `nextcloud`     


## Troubleshooting



## Getting started 

### Working with minikube (local)

```

$ minikube start
$ minikube addons enable ingress
```

#### Configure TLS

```
$ brew install mkcert
$ mkcert -install
$ mkcert -CAROOT
$ mkcert -key-file key.pem -cert-file cert.pem minikube.net *.minikube.net

$ kubectl -n kube-system create secret tls mkcert --key key.pem --cert cert.pem

$ vi /etc/hosts
127.0.0.1 txs-service.minikube.net
127.0.0.1 cgw-service.minikube.net
127.0.0.1 cfg-service.minikube.net
127.0.0.1 safe-wallet.minikube.net

$ minikube addons configure ingress
$ minikube addons disable ingress
$ minikube addons enable ingress
```


--- 

### TODO list

- [X] Config service
- [X] Client gateway service
- [X] Wallet service
- [ ] Events service
- [ ] use Secret when necessary
- [ ] Use Helm dependancies for PG, Redis and RabbotMQ
- [ ] Congigure Helm output after install to explain how to configure txs-service and cfg-service

### Bugs list
- [ ] CFG Media URL not working or use S3 (e.g minio)