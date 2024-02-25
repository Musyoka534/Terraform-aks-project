/*data "azurerm_kubernetes_cluster" "aks_cluster_data" {
  name                = azurerm_kubernetes_cluster.aks-cluster.name
  resource_group_name = azurerm_kubernetes_cluster.aks-cluster.rgname
} */
/*output "aks_service_principal_object_id" {
  description = "Object ID of the AKS service principal"
  value       = azurerm_kubernetes_cluster.aks-cluster.kube_config[0].client_id
} */