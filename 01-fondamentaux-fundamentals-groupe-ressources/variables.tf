variable "location" {
  type        = string
  description = "Azure region"
  default     = "West Europe"

}
variable "rsg" {
  type        = string
  description = "Azure resource group name"
  default     = "terraform_lab-rg"

}
# Terraform variables pour la configuration de l'infrastructure Azure.