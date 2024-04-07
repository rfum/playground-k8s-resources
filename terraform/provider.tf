provider "proxmox" {
  endpoint = var.proxmox_endpoint
  username = "root@pam"
  password = var.root_password
  # because self-signed TLS certificate is in use
  insecure = true

  ssh {
    agent = true

  }
}