variable "proxmox_endpoint" {
  type    = string
  default = "<node-ip>:port"
}

# required to login proxmox host. don't keep it open and untrack this file after editing with :
# git update-index --assume-unchanged terraform/vars.tf
variable "root_password" {
  type    = string
  default = "changeme123"
}

variable "node_name" {
  type    = string
  default = "node"
}

# Below is sample please change them based on your network config.

variable "worker_3" {
  type    = string
  default = "192.168.0.244/24"
}
variable "node_default_gw" {
  type    = string
  default = "192.168.0.1"
}