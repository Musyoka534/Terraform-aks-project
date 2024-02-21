variable "keyvault_name" {
    type = string
    description = "Key Vault Name"
}
variable "location" {
    type = string
    description = "KeyVault Location"
 
}
variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "service_principal_name" {
    type = string
}
variable "service_principal_object_id" {}
variable "service_principal_tenant_id" {}