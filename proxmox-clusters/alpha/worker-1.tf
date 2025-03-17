resource "proxmox_virtual_environment_vm" "vm_worker_1" {
  name      = "worker1"
  node_name = var.node_name

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
  }


  initialization {

    ip_config {
      ipv4 {
        address = var.worker_1_ip
        gateway = var.node_default_gw
      }
    }

    dns {
      servers = [var.dns_address]
    }

    user_account {
      keys     = [trimspace(tls_private_key.debian_vm_key.public_key_openssh)]
      username = "ubuntu"
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
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 150
  }

  network_device {
    bridge = "vmbr0"
  }
}
