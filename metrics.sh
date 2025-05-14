#!/bin/bash

ROOT=$(dirname $0)

tee patch.yml << EOF
---
spec:
  template:
    spec:
      containers:
        - name: manager
          args:
            - --health-probe-bind-address=:8081
            - --metrics-bind-address=:8443
            - --leader-elect
            - --catalogd-cas-dir=/var/certs
            - --pull-cas-dir=/var/certs
            - --tls-cert=/var/certs/tls.cert
            - --tls-key=/var/certs/tls.key
            - --feature-gates=HelmChartSupport=true
EOF

kubectl -n olmv1-system patch deployment operator-controller-controller-manager --patch-file=patch.yml
rm -fv patch.yml

kubectl -n olmv1-system wait --for condition=ready pods -l control-plane=operator-controller-controller-manager

kubectl apply -f ${ROOT}/manifests/metrics-server-rbac.yml

kubectl apply -f ${ROOT}/manifests/metrics-server.yml
