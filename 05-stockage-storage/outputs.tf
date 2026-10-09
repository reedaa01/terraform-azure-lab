output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.terraform_storage.name
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.terraform_storage.id
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint URL"
  value       = azurerm_storage_account.terraform_storage.primary_blob_endpoint
}

output "container_name" {
  description = "Name of the blob container"
  value       = azurerm_storage_container.terraform_container.name
}
