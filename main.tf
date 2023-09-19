resource "azurerm_resource_group" "mcit" {
  name     = "rg-${convention}"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "myk8s" {
  name                = "k8s-${convention}"
  location            = azurerm_resource_group.myk8s.location
  resource_group_name = azurerm_resource_group.myk8s.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
