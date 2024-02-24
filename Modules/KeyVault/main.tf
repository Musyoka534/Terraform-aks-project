data "azurerm_client_config" "current" {}
  

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.rgname
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = true
  
  sku_name = "standard"
  tags = {
    Owner        = "Information,Communications and Technology"
    BusinessUnit = "IT Cloud Engineering"
    Environment  = "Dev"
    CreatedBy    = "Musyoka Kilonzo"
  }
}

