variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "rsg" {
  description = "Azure resource group name"
  type        = string
  default     = "terraform-dev-rg"
}

variable "vnet_name" {
  description = "Existing VNet name"
  type        = string
  default     = "terraform-vnet"
}

variable "public_subnet_name" {
  description = "Existing public subnet name"
  type        = string
  default     = "terraform-public-subnet"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "terraform-vm"
}

variable "nic_name" {
  description = "Network interface name"
  type        = string
  default     = "terraform-vm-nic"
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
  default     = "terraform-vm-pip"
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for VM login"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VM login"
  type        = string
  sensitive   = true
}