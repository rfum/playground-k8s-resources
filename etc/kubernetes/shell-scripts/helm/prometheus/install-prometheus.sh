#!/bin/bash

# Variables
NAMESPACE="monitoring"
VALUES_FILE="values.yaml"  # Replace this with the actual path to your values.yaml file

# Add Prometheus Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Update Helm repositories
helm repo update

# Create Kubernetes namespace for Prometheus, if it doesn't already exist
kubectl get namespace $NAMESPACE > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Creating namespace $NAMESPACE"
    kubectl create namespace $NAMESPACE
fi

# Install Prometheus using Helm with custom values.yaml
if [ -f "$VALUES_FILE" ]; then
    echo "Installing Prometheus with custom values.yaml"
    helm install prometheus prometheus-community/prometheus --namespace $NAMESPACE -f $VALUES_FILE
else
    echo "Custom values.yaml file not found at $VALUES_FILE"
    exit 1
fi
