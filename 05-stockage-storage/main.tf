terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "terraform_dev_rg" {
  name = var.rsg
}

resource "random_string" "storage_suffix" {
  length  = 8
  upper   = false
  special = false
}

locals {
  storage_account_name = "${var.storage_account_prefix}${random_string.storage_suffix.result}"
}

resource "azurerm_storage_account" "terraform_storage" {
  name                     = local.storage_account_name
  resource_group_name      = data.azurerm_resource_group.terraform_dev_rg.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"

  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "terraform_container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.terraform_storage.id
  container_access_type = "private"
}
