terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.51.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  username = "root@pam"
  password = var.root_password
  # because self-signed TLS certificate is in use
  insecure = true

  ssh {
    agent = false

  }
}