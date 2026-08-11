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
resource "azurerm_resource_group" "terraform_lab" {
  name     = "terraform_lab-rg"
  location = "West Europe"
}