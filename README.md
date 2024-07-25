 # Safe Kubernetes Helm charts

[Helm](https://helm.sh/) repo for different charts related to Safe which can be installed on Kubernetes

> [!WARNING]  
> **Disclaimer:** This repository is currently a work in progress. While contributions and feedback are welcome, please note that the code and features may change frequently, and some functionalities may not be fully implemented or tested. Use this project at your own risk.


## Prerequisites

- [Kubernetes 1.19+](https://kubernetes.io/)
- [Helm 3+](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.


## Helm Repository

To install the repo just run:

```bash
helm repo add safe https://5afe.github.io/safe-helm-charts/charts/packages
helm repo update
```


You can then run the following command to see the available Helm charts.

```bash
helm search repo safe
```

## Helm Charts

### [safe/safe-stack](./charts/safe-stack/)

```bash
helm install [RELEASE-NAME] safe/safe-stack
```

For more information, please checkout the chart level [README.md](./charts/safe-stack/README.md).

## Support and Contribution
This helm chart is community maintained, and not supported by Nextcloud GmbH. Please also review the official [Safe Code of Conduct*](https://changeme) and this repo's [contributing doc*](./CONTRIBUTING.md) before contributing.

### Questions and Discussions
[GitHub Discussion*](https://changeme)

### Bugs and other Issues
If you have a bug to report or a feature to request, you can first search the [GitHub Issue*](https://changeme), and  if you can't find what you're looking for, feel free to open an issue.

### Contributing to the Code
We're always happy to review a pull request :) Please just be sure to check the pull request template to make sure you fufill all the required checks, most importantly the [DCO*](https://probot.github.io/apps/dco/).

## TODO list

- [ ] Split all components into a separate charts
- [ ] GitHub Action to automate release
- [ ] Fix README (missing/broken links)
- [ ] Add licence and code-of-conduct