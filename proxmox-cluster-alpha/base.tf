resource "proxmox_virtual_environment_download_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  file_name    = "debian-12-generic-amd64.qcow2.img"
  url          = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
}

resource "tls_private_key" "debian_vm_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "proxmox_virtual_environment_file" "qemu-install" {
  content_type = "snippets"
  datastore_id = "vm-snippets"
  node_name    = var.node_name

  source_raw {
    data = <<EOF
#qemu-install
users:
  - default
  - name: debian
    groups:
      - sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${trimspace(data.local_file.ssh_public_key.content)}
    sudo: ALL=(ALL) NOPASSWD:ALL
runcmd:
    - apt update && apt upgrade -y
    - apt install qemu-guest-agent -y
    EOF

    file_name = "qemu-install.yaml"
  }
}