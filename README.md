# Kubernetes Deployment Playground

Welcome to the Kubernetes Deployment Playground! This repository is designed to help users set up and experiment with various Kubernetes environments. Whether you're learning Kubernetes, testing different deployments, or managing infrastructure, this repository provides tools and configurations to assist you.

## Overview

This repository includes:

- **Vagrant Configuration**: Located in the `vagrant` directory, it provides Vagrantfiles for setting up virtualized environments specific to Kubernetes.
- **Proxmox Cluster Setup**: Found in the `proxmox-clusters` directory, it contains configurations for setting up Kubernetes clusters on Proxmox virtual environments.
- **Additional Resources**: The `etc` directory includes supplementary configurations and scripts to enhance your Kubernetes setup.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Vagrant](https://www.vagrantup.com/): For to create a vagrant managed clusters.
- [VirtualBox](https://www.virtualbox.org/) or another Vagrant provider: As the hypervisor for running VMs.
- [Proxmox](https://www.proxmox.com/): For managing virtualized environments, if you're using the Proxmox configurations.
- [kubectl](https://kubernetes.io/docs/tasks/tools/): For interacting with your Kubernetes clusters.
- [terraform](https://www.terraform.io/) : For to provision proxmox instances.
- [Ansible](https://docs.ansible.com/) : For executing ansible playbooks to install various services.
