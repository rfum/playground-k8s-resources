#!/bin/bash

# Set variables
REPO_NAME="grafana"
CHART_NAME="grafana"
REPO_URL="https://grafana.github.io/helm-charts"
NAMESPACE="monitoring"
VALUES_FILE="values.yaml"

# Check if Helm is installed
if ! command -v helm &> /dev/null
then
    echo "Helm is not installed. Please install Helm and try again."
    exit 1
fi

# Add Grafana Helm chart repository if not already added
helm repo add $REPO_NAME $REPO_URL

# Update Helm repositories to get the latest charts
helm repo update

# Create the namespace if it doesn't exist
kubectl get namespace $NAMESPACE &> /dev/null
if [ $? -ne 0 ]; then
  echo "Namespace $NAMESPACE does not exist. Creating it..."
  kubectl create namespace $NAMESPACE
fi

# Install or upgrade the Grafana Helm chart with the custom values.yaml file
if [ -f "$VALUES_FILE" ]; then
  helm upgrade --install $CHART_NAME $REPO_NAME/$CHART_NAME \
    --namespace $NAMESPACE \
    --values $VALUES_FILE
else
  echo "Custom values file ($VALUES_FILE) not found. Please provide the correct path to the file."
  exit 1
fi

# Check if Grafana is successfully installed
if [ $? -eq 0 ]; then
  echo "Grafana has been successfully installed/upgraded."
else
  echo "An error occurred during the installation of Grafana."
fi
