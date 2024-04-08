resource "random_password" "debian_vm_password_master" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_vm" "debian_vm_master" {
  name      = "master"
  node_name = var.node_name

  initialization {

    ip_config {
      ipv4 {
        address = var.master_ip
        gateway = "192.168.0.1"
      }
    }

    user_account {
      password = random_password.debian_vm_password_master.result
      username = "debian"
    }
  }

  keyboard_layout = "tr"

  on_boot = true

  cpu {
    cores = 1
    limit = 3
  }

  memory {
    dedicated = 2512
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.debian_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }
  disk {
    datastore_id = "local-lvm"
    interface    = "virtio0"
    file_format  = "raw"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}
