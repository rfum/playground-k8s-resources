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