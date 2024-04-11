output "debian_vm_private_key" {
  value     = tls_private_key.debian_vm_key.private_key_pem
  sensitive = true
}

output "debian_vm_public_key" {
  value = tls_private_key.debian_vm_key.public_key_openssh
}