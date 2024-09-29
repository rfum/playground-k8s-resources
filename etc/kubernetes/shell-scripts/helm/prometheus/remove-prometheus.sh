#!/bin/bash

# Variables
NAMESPACE="monitoring"

# Uninstall Prometheus Helm release
echo "Uninstalling Prometheus Helm release"
helm uninstall prometheus --namespace $NAMESPACE

# Delete Prometheus namespace (optional)
echo "Deleting namespace $NAMESPACE"
kubectl delete namespace $NAMESPACE

# Remove Prometheus Helm repository
echo "Removing Prometheus Helm repository"
helm repo remove prometheus-community
