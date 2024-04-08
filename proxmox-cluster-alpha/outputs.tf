output "debian_vm_password_master" {
  value     = random_password.debian_vm_password_master.result
  sensitive = true
}

output "debian_vm_password_worker_0" {
  value     = random_password.debian_vm_password_worker_0.result
  sensitive = true
}

output "debian_vm_password_worker_1" {
  value     = random_password.debian_vm_password_worker_1.result
  sensitive = true
}

output "debian_vm_password_worker_2" {
  value     = random_password.debian_vm_password_worker_2.result
  sensitive = true
}