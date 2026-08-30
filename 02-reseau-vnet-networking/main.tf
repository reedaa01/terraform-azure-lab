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

resource "azurerm_virtual_network" "terraform_dev_rg" {
  name                = "terraform-vnet"
  resource_group_name = "terraform-dev-rg"
  location            = "West Europe"
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "terraform_dev_rg" {
  name                 = "terraform-public-subnet"
  resource_group_name  = "terraform-dev-rg"
  virtual_network_name = azurerm_virtual_network.terraform_dev_rg.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "terraform_dev_rg_private" {
  name                 = "terraform-private-subnet"
  resource_group_name  = "terraform-dev-rg"
  virtual_network_name = azurerm_virtual_network.terraform_dev_rg.name
  address_prefixes     = ["10.0.2.0/24"]
}