output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.terraform_vm.id
}

output "vm_public_ip" {
  description = "Public IP address of the virtual machine"
  value       = azurerm_public_ip.terraform_vm_pip.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the virtual machine"
  value       = azurerm_network_interface.terraform_vm_nic.private_ip_address
}
