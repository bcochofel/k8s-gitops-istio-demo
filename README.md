# k8s-gitops-istio-demo

[![pre-commit badge][pre-commit-badge]][pre-commit] [![Conventional commits badge][conventional-commits-badge]][conventional-commits] [![Keep a Changelog v1.1.0 badge][keep-a-changelog-badge]][keep-a-changelog] [![MIT License Badge][license-badge]][license]

Kubernetes manifests that can be used with GitOps.
Most of the manifests use Helm Operator, so you need to have that installed on your cluster.

# pre-commit hooks

Read the [pre-commit hooks](docs/pre-commit-hooks.md) document for more info.

# git-chglog

Read the [git-chglog](docs/git-chlog.md) document for more info.

## Requirements

The scenarios under `kustomize/` use [Kustomize](https://github.com/kubernetes-sigs/kustomize).

The directory `manifests/` uses [Helm Operator](https://github.com/fluxcd/helm-operator).

# Scenarios

- Istio demo (uses istio demo profile)
- Istio production (uses default profile)

## Istio Production

This scenario uses the [Istio Integrations](https://istio.io/latest/docs/ops/integrations/).

Uses cert-manager Self Signed Issuer and Certificate for all the `demo.lab` addresses.

Add to following to your hosts file:

```
192.168.77.105	demo.lab www.demo.lab
192.168.77.105  bookinfo.demo.lab
192.168.77.105  grafana.demo.lab
192.168.77.105  alertmanager.demo.lab
192.168.77.105  prometheus.demo.lab
192.168.77.105  istio-prometheus.demo.lab
192.168.77.105  kiali.demo.lab
192.168.77.105  tracing.demo.lab
```

You can use those addresses to connect to the components on this scenario.

Prometheus is deployed using the new Prometheus Operator [chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack).

[Observability Best Practices](https://istio.io/latest/docs/ops/best-practices/observability/) are implemented using another Prometheus instance to scrape metrics from Istio.
The Prometheus instances use labels (tier=cluster and tier=istio) to separate the scrape and rules for each scope.

You can use [this repo](https://github.com/bcochofel/terraform-modules) to deploy both Istio and Flux using Terraform (`examples` folder)

[pre-commit]: https://github.com/pre-commit/pre-commit
[pre-commit-badge]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
[conventional-commits-badge]: https://img.shields.io/badge/Conventional%20Commits-1.0.0-green.svg
[conventional-commits]: https://conventionalcommits.org
[keep-a-changelog-badge]: https://img.shields.io/badge/changelog-Keep%20a%20Changelog%20v1.1.0-%23E05735
[keep-a-changelog]: https://keepachangelog.com/en/1.0.0/
[license]: ./LICENSE
[license-badge]: https://img.shields.io/badge/license-MIT-green.svg
[changelog]: ./CHANGELOG.md
[changelog-badge]: https://img.shields.io/badge/changelog-Keep%20a%20Changelog%20v1.1.0-%23E05735
