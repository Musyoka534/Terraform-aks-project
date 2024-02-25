resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true

}
resource "azurerm_role_assignment" "acr_role" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = var.aks_service_principal_object_id
  skip_service_principal_aad_check = true
}
