variable "proxmox_endpoint" {
  type    = string
  default = "<proxmox_node_ip:port>"
}

# required to login proxmox host. don't keep it open and untrack this file after editing with :
# git update-index --assume-unchanged terraform/vars.tf
variable "root_password" {
  type    = string
  default = "<root-password>"
}

variable "node_name" {
  type = string
  default = "pve"
}

# Below is sample please change them based on your network config.

variable "master_ip" {
  type = string
  default = "192.168.0.2/24"
}

variable "worker_0_ip" {
  type = string
  default = "192.168.0.3/24"
}

variable "worker_1_ip" {
  type = string
  default = "192.168.0.4/24"
}

variable "worker_2_ip" {
  type = string
  default = "192.168.0.5/24"
}

variable "node_default_gw" {
  type = string
  default = "192.168.0.1"
}