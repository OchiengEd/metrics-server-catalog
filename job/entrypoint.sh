#!/bin/bash

# Metrics-server download and upload to OCI registry
charts=("https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.12.0/metrics-server-3.12.0.tgz" \
  "https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.12.1/metrics-server-3.12.1.tgz" \
  "https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.12.2/metrics-server-3.12.2.tgz" \
)

for chart in ${charts[@]}
do
    echo "Downloading ${chart}..."
    curl --progress-bar -LO ${chart};
done

for item in $(ls metrics-server-3.12.[0-2].tgz)
do
    helm push ${item} oci://registry.olmv1-system.svc.cluster.local --insecure-skip-tls-verify && \
        rm -fv ${item}
done
