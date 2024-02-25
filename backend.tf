terraform {
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "tfstatebackend12"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}