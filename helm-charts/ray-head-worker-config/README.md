# General Webhook Helm Chart

A typical helm package for configuring ray cluster.

# Introduction

This helm package is for deploying ray cluster and the required config files to teams in their namespaces. Helm charts are built via corresponding helm values.
Therefore, multiple instances of the chart can be created with various helm values passed via `values.yaml`

# Examples

Helm charts are deployed via helm releases.

The user-supplied values are set when deploying a Helm chart. The user set values override computed values.

To get the helm values passed for a specific release, use:

```shell
helm get values <release-name>
```

Different event subscriptions have respective values file for building the chart.

* A Helm release has Values stored with the initial release.

As newer releases get deployed, the values of a Helm chart change.
Using the helm get values command downloads the Values file for a specified release.
