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