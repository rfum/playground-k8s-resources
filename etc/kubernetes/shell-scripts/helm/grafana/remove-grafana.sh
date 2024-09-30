#!/bin/bash

# Set variables
CHART_NAME="grafana"
NAMESPACE="monitoring"

# Uninstall the Grafana Helm release
echo "Uninstalling Grafana Helm release..."
helm uninstall $CHART_NAME --namespace $NAMESPACE

# Check if the uninstall was successful
if [ $? -eq 0 ]; then
  echo "Grafana has been successfully uninstalled from the $NAMESPACE namespace."

  # Optionally delete the namespace (uncomment the lines below to enable this)
  # echo "Deleting namespace $NAMESPACE..."
  # kubectl delete namespace $NAMESPACE
else
  echo "An error occurred while uninstalling Grafana."
fi
