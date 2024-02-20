variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "location" {
  type    = string
  default = "South Africa North"

}
variable "service_principal_name" {
  type = string
}
variable "keyvault_name" {
  type        = string
  description = "Key Vault Name"
}
