resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rgname
  address_space       = [var.vnet.cird]
}
resource "azurerm_subnet" "aks-subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.vnet.sn_cluster_cird]
}