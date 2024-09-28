resource "random_password" "debian_vm_password_master" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_vm" "debian_vm_master" {
  name      = "master"
  node_name = var.node_name

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
  }

  initialization {

    ip_config {
      ipv4 {
        address = var.master_ip
        gateway = var.node_default_gw
      }
    }

    user_account {
      username = "debian"
      password = "changeme"
    }

  }

  keyboard_layout = "tr"

  on_boot = true

  cpu {
    cores = 2
    limit = 3
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.debian_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 50
  }

  network_device {
    bridge = "vmbr0"
  }
}
