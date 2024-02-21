terraform {
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "dtbxitest"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}