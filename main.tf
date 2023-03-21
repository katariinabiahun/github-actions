resource "azurerm_kubernetes_cluster" "this" {
  name                = var.kubernetes_cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix

  tags = var.tags

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size
    enable_auto_scaling = var.autoscale
    min_count           = var.autoscale == true ? var.min_count : null
    max_count           = var.autoscale == true ? var.max_count : null
    vnet_subnet_id      = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
    pod_cidr           = var.pod_cidr
    load_balancer_sku  = var.load_balancer_sku
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count

    ]
  }
}