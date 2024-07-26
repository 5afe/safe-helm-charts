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
127.0.0.1 node.minikube.net

minikube addons configure ingress
minikube addons disable ingress
minikube addons enable ingress
```


#### Install the Chart independantly

```bash
helm dependency build charts/safe-transaction-service/
helm install txs-service ./charts/safe-transaction-service

helm dependency build charts/safe-config-service
helm install cfg-service ./charts/safe-config-service

helm dependency build charts/safe-client-gateway
helm install cgw-service ./charts/safe-client-gateway

helm install wallet-web ./charts/safe-wallet-web
```


```bash
helm uninstall txs-service cfg-service cgw-service wallet-web
```


#### Install the Chart (safe-stack batch)

```bash
helm dependency build charts/safe-stack
helm install safe-stack ./charts/safe-stack

kubectl get pods
NAME                                                              READY   STATUS    RESTARTS   AGE
safe-stack-safe-client-gateway-redis-76dd97b544-jbbq6             1/1     Running   0          75s
safe-stack-safe-client-gateway-web-9bc6fcd6f-rhktw                1/1     Running   0          74s
safe-stack-safe-config-service-postgresql-566b5cb8b-9qh6c         1/1     Running   0          74s
safe-stack-safe-config-service-web-79dc4cf6fc-5r7ks               2/2     Running   0          74s
safe-stack-safe-transaction-service-ganache-node-d99c5f59d9575j   1/1     Running   0          75s
safe-stack-safe-transaction-service-postgresql-5c869cfb99-xgwp4   1/1     Running   0          74s
safe-stack-safe-transaction-service-rabbitmq-57dc4698f9-lww2k     1/1     Running   0          75s
safe-stack-safe-transaction-service-redis-55b45bbcb8-vbtqn        1/1     Running   0          74s
safe-stack-safe-transaction-service-scheduler-7bf779f696-tj8xv    1/1     Running   0          74s
safe-stack-safe-transaction-service-web-6c68869558-h224w          2/2     Running   0          75s
safe-stack-safe-transaction-service-worker-6654b65bf7-mmbtt       1/1     Running   0          74s
safe-stack-safe-wallet-web-8b58b7957-x5c8x                        1/1     Running   0          75s
```




```bash
helm uninstall safe-stack
```
