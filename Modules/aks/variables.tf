variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "location" {
  type    = string
  default = "South Africa North"

}
variable "aks_name" {
  type        = string
  description = "AKS Name"
}
variable "client_id" {}
variable "client_secret" {
    type = string
    sensitive = true
}
variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}
variable "vnet" {
  type = object({
    cird            = string
    sn_cluster_cird = string
  })
  default = {
    cird            = "192.168.0.0/16"
    sn_cluster_cird = "192.168.0.0/17"
  }
  description = "The VNET and subnet configuration."
}
variable "vnet_name" {}
variable "aks_subnet_name" {}