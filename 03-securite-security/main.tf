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

resource "azurerm_network_security_group" "terraform_dev_rg" {
  name                = "terraform-nsg"
  location            = "West Europe"
  resource_group_name = data.azurerm_resource_group.terraform_dev_rg.name
}

data "azurerm_resource_group" "terraform_dev_rg" {
  name = "terraform-dev-rg"
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.terraform_dev_rg.name
  network_security_group_name = azurerm_network_security_group.terraform_dev_rg.name


}
resource "azurerm_network_security_rule" "allow_http" {
  name                        = "allow-http"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.terraform_dev_rg.name
  network_security_group_name = azurerm_network_security_group.terraform_dev_rg.name
}