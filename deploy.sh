#!/bin/bash

ROOT=$(dirname $0)

# Deploy an OCI registry
kubectl apply -f ${ROOT}/manifests/registry.yml

# Wait for the registry to be ready
kubectl -n olmv1-system wait --for=jsonpath='{.status.phase}'=Running pod -l app=registry

# Upload charts to the registry
kubectl apply -f ${ROOT}/manifests/uploader-job.yml

# Deploy cluster catalog
kubectl apply -f ${ROOT}/manifests/clustercatalog.yml
