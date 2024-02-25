# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = var.rgname
  location = var.location
  tags = {
    Owner        = "Information,Communications and Technology"
    BusinessUnit = "IT Cloud Engineering"
    Environment  = "Dev"
    CreatedBy    = "Cloud Engineer"
  }
}

module "spn" {
  source                 = "./Modules/ServicePrincipal"
  service_principal_name = var.service_principal_name
  depends_on = [
    azurerm_resource_group.dev-rg
  ]

}

resource "azurerm_role_assignment" "rolespn" {
  scope                = "/subscriptions/xxxx-xxxx-xxxx-xxxx"
  role_definition_name = "Contributor"
  principal_id         = module.spn.service_principal_object_id
  depends_on = [
    module.spn
  ]
}

module "keyvault" {
  source                      = "./Modules/KeyVault"
  location                    = var.location
  rgname                      = var.rgname
  keyvault_name               = var.keyvault_name
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.spn.service_principal_object_id
  service_principal_tenant_id = module.spn.service_principal_tenant_id
  depends_on = [
    module.spn
  ]
}
resource "azurerm_key_vault_secret" "key-secret" {
  name         = module.spn.client_id
  value        = module.spn.client_secret
  key_vault_id = module.keyvault.keyvault_id
  depends_on = [
    module.keyvault
  ]
}
module "aks" {
  source          = "./Modules/aks"
  rgname          = var.rgname
  aks_name        = var.aks_name
  client_id       = module.spn.client_id
  client_secret   = module.spn.client_secret
  location        = var.location
  vnet_name       = var.vnet_name
  aks_subnet_name = var.aks_subnet_name

  depends_on = [
    module.spn
  ]

}

module "acr" {
  source                          = "./modules/acr"
  rgname                          = var.rgname
  location                        = var.location
  acr_name                        = var.acr_name
  aks_service_principal_object_id = module.spn.client_id
  depends_on = [
    module.aks, module.spn
  ]
}