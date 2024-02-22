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