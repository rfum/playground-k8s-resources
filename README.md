# Kubernetes Deployment Playground

Welcome to the Kubernetes Deployment Playground! This repository is designed to help users set up and experiment with various Kubernetes environments, deploy configurations using Helm, and manage infrastructure through Terraform. Whether you are learning Kubernetes, testing different deployments, or managing infrastructure, this repository provides tools and configurations to assist you.

## Overview

This repository includes:
- **Vagrantfiles** for setting up virtualized environments specific to Kubernetes.
- **Helm Charts** and configurations for deploying services and applications on Kubernetes.
- **A Terraform project** for provisioning VMs on a Proxmox host, ideal for creating real-world Kubernetes clusters.
- **A Kubespray configuration** for spinning up a kubernetes cluster.
## Prerequisites

Before you begin, ensure you have the following installed:
- [Vagrant](https://www.vagrantup.com/downloads.html): For managing development environments.
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or another Vagrant provider: As the hypervisor for running VMs.
- [kubectl](https://kubernetes.io/docs/tasks/tools/): For interacting with your Kubernetes clusters.
- [Helm](https://helm.sh/docs/intro/install/): For managing Kubernetes applications.
- [Terraform](https://www.terraform.io/downloads.html): For building, changing, and versioning infrastructure safely and efficiently.
- [Ansible](https://www.ansible.com/): For automating Kubernetes cluster deployment via Kubespray.

## Getting Started

### 1. Clone the Repository

Clone this repository to get started with the resources provided:

```bash
git clone https://github.com/rfum/playground-k8s-resources.git
cd playground-k8s-resources
