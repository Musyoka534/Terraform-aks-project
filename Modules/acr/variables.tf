variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "location" {
  type    = string
  default = "South Africa North"

}
variable "acr_name" {
  description = "Name for Azure Container Registry"
  type        = string
}

variable "aks_service_principal_object_id" {
  description = "Object ID of the AKS service principal"
  type        = string
}
