terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "terraform_dev_rg" {
  name = var.rsg
}

data "azurerm_virtual_network" "terraform_dev_vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.terraform_dev_rg.name
}

data "azurerm_subnet" "terraform_public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = data.azurerm_resource_group.terraform_dev_rg.name
  virtual_network_name = data.azurerm_virtual_network.terraform_dev_vnet.name
}

resource "azurerm_public_ip" "terraform_vm_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.terraform_dev_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "terraform_vm_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.terraform_dev_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.terraform_public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_vm_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "terraform_vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.terraform_dev_rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.terraform_vm_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
