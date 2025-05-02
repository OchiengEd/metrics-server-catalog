#!/bin/bash

ROOT=$(dirname $0)

kubectl apply -f ${ROOT}/manifests/metrics-server-rbac.yml

kubectl apply -f ${ROOT}/manifests/metrics-server.yml
