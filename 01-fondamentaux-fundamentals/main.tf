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
  name     = var.rsg
  location = var.location
}



# Provider : fournisseur cloud utilise par Terraform (ici Azure via azurerm).
# Resource : objet d'infrastructure a creer (exemple : groupe de ressources).
# terraform init : initialise le dossier Terraform et telecharge les providers/modules.
# terraform validate : verifie la syntaxe et la coherence de la configuration.
# terraform plan : affiche les changements prevus avant application.
# terraform apply : applique les changements sur l'infrastructure reelle.
# terraform destroy : supprime les ressources gerees par Terraform.
# Terraform state : fichier d'etat qui suit les ressources et leur mapping reel.
# In-place change vs replacement : modification sur place ou recreation complete d'une ressource.
# terraform fmt : formate le code Terraform selon les conventions.
# terraform state list : liste les ressources gerees par Terraform.
# terraform state show <resource> : affiche les details d'une ressource specifique dans l'etat.