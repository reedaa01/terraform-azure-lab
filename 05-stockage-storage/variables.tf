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

variable "storage_account_prefix" {
  description = "Storage account prefix (must be lower-case letters and numbers only)"
  type        = string
  default     = "tfstlab"

  validation {
    condition     = can(regex("^[a-z0-9]{3,16}$", var.storage_account_prefix))
    error_message = "storage_account_prefix must be 3-16 characters, lowercase letters or numbers only."
  }
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "Blob container name"
  type        = string
  default     = "lab-data"
}
