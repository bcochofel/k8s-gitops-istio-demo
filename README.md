# k8s-gitops-istio-demo

[![Validate Scenarios](https://github.com/bcochofel/k8s-gitops-istio-demo/workflows/Validate%20Scenarios/badge.svg)](https://github.com/bcochofel/k8s-gitops-istio-demo/blob/master/.github/workflows/validate.yml)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![GitHub license](https://img.shields.io/github/license/bcochofel/k8s-gitops-istio-demo.svg)](https://github.com/bcochofel/k8s-gitops-istio-demo/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/k8s-gitops-istio-demo)](https://github.com/bcochofel/k8s-gitops-istio-demo/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/k8s-gitops-istio-demo.svg)](https://github.com/bcochofel/k8s-gitops-istio-demo/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/k8s-gitops-istio-demo.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/k8s-gitops-istio-demo/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/k8s-gitops-istio-demo.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/k8s-gitops-istio-demo/stargazers/)

Kubernetes manifests that can be used with GitOps.
Most of the manifests use Helm Operator, so you need to have that installed on your cluster.

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
