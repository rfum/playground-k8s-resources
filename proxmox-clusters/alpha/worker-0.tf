resource "random_password" "debian_vm_password_worker_0" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "proxmox_virtual_environment_vm" "debian_vm_worker_0" {
  name      = "worker0"
  node_name = var.node_name

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
  }

  initialization {

    ip_config {
      ipv4 {
        address = var.worker_0_ip
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
  }

  memory {
    dedicated = 12288
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.debian_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 150
  }

  network_device {
    bridge = "vmbr0"
  }
}
