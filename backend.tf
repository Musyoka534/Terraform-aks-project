terraform {
  backend "azurerm" {
    resource_group_name  = var.rgname
    storage_account_name = "backendsa101"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}