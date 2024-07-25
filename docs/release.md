## Release

```

helm package charts/safe-transaction-service -d charts/packages
helm package charts/safe-config-service -d charts/packages
helm package charts/safe-client-gateway -d charts/packages
helm package charts/safe-wallet-web -d charts/packages

helm dependency build charts/safe-stack/
helm package charts/safe-stack -d charts/packages

helm repo index ./charts/packages/ --url https://5afe.github.io/safe-helm-charts/charts/packages
```