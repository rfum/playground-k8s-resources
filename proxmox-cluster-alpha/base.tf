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

resource "proxmox_virtual_environment_file" "okd_config" {
  content_type = "snippets"
  datastore_id = "vm-snippets"
  node_name    = var.node_name

  source_raw {
    data = <<EOF
#okd-config
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
    - apt install -y curl wget git net-tools software-properties-common apt-transport-https
    - curl -fsSL https://get.docker.com -o get-docker.sh
    - sh get-docker.sh
    - apt install -y podman
    - swapoff -a
    - sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
    EOF

    file_name = "okd-config.yaml"
  }
}