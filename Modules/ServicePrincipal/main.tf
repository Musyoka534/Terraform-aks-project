data "azuread_client_config" "current" {}

resource "azuread_application" "spn" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "spn" {
  client_id                    = azuread_application.spn.client_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.current.object_id]
}
resource "azuread_service_principal_password" "spn" {
  service_principal_id = azuread_service_principal.spn.object_id
}