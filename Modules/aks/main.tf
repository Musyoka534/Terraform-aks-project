#Datasource to get the Latest AKS Version
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rgname
  dns_prefix          = "${var.rgname}-aks-cluster" 
  node_resource_group = "${var.rgname}-nrg"
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  private_cluster_enabled = true
  role_based_access_control_enabled = true

  default_node_pool {
    name       = "devpool"
    vm_size    = "Standard_DS2_v2"
    zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 2
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepoolos"       = "linux"
     } 
   tags = {
    "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
  }
}
service_principal {
  client_id = var.client_id
  client_secret = var.client_secret
}
linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"

  }
}
