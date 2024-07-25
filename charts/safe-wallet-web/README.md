# Safe-Wallet-Web

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/safe-transaction-service)](https://artifacthub.io/packages/search?repo=safe-transaction-service)

[Safe](https://safe.global/) is the leading Web3 Smart-Account infrastructure.

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.

## Introduction

This chart bootstraps a [safe](https://github.com/safe-global/safe-infrastructure) infrastructure deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

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
- PostgreSQL v14
- Redis
- RabbitMQ 
- Ethereum node


## Installing the Chart

To install the chart with the release name `[RELEASE-NAME]`:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages
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
| `xxxxxx`                                         | xxxx                                                                                | `xxxx`     


## Troubleshooting

- 


## Development 

### Developing locally with Minikube (on MacOS)

#### Install and Configure [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fbinary+download)

```bash
brew install minikube
minikube start
minikube addons enable ingress
```

#### Configure TLS for your Ingresses

```bash
brew install mkcert
mkcert -install
mkcert -CAROOT
mkcert -key-file key.pem -cert-file cert.pem minikube.net *.minikube.net

kubectl -n kube-system create secret tls mkcert --key key.pem --cert cert.pem

vi /etc/hosts
127.0.0.1 txs-service.minikube.net
127.0.0.1 cgw-service.minikube.net
127.0.0.1 cfg-service.minikube.net
127.0.0.1 safe-wallet.minikube.net

minikube addons configure ingress
minikube addons disable ingress
minikube addons enable ingress
```


#### Install the Chart

```bash
helm install my-safe-stack .

$ kubectl get pods
NAME                                           READY   STATUS    RESTARTS   AGE
my-safe-stack-cfg-db-669fd4fb69-5n7pj          1/1     Running   0          4h21m
my-safe-stack-cfg-web-798dc55779-w2gqc         2/2     Running   0          65m
my-safe-stack-cgw-redis-dcf485664-nq8df        1/1     Running   0          4h21m
my-safe-stack-cgw-web-b6f9d64bf-hlxq6          1/1     Running   0          4h21m
my-safe-stack-ganache-node-687b5f64c9-sbwht    1/1     Running   0          4h21m
my-safe-stack-txs-db-7ff8d54fcd-qmvxj          1/1     Running   0          4h21m
my-safe-stack-txs-rabbitmq-569f559f67-rqtv4    1/1     Running   0          4h21m
my-safe-stack-txs-redis-58d946c556-5krs4       1/1     Running   0          4h21m
my-safe-stack-txs-scheduler-65b796f5c6-rqh7r   1/1     Running   0          4h21m
my-safe-stack-txs-web-669f98475c-blxr7         2/2     Running   0          4h21m
my-safe-stack-txs-worker-649b65bf65-k29z8      1/1     Running   0          4h21m
my-safe-stack-wallet-79894d9789-z9sph          1/1     Running   0          4h21m
```

--- 

### TODO list

- [X] Config service
- [X] Client gateway service
- [X] Wallet service
- [ ] Events service
- [ ] use Secret when necessary
- [ ] Use Helm dependancies for PG, Redis and RabbitMQ
- [ ] Configure Helm output after install to explain how to configure txs-service and cfg-service
      - NOTES.txt

### Bugs list
- [ ] CFG Media URL not working or use S3 (e.g minio)