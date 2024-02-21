variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "location" {
  type    = string
  default = "South Africa North"
}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "aks_subnet_name" {}
variable "aks_subnet_prefix" {}