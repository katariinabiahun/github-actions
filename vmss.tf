data "azurerm_virtual_machine_scale_set" "this" {
  name                = var.vmss_name 
  resource_group_name = var.vmss_resource_group_name 
}

resource "null_resource" "vmss_update" {
  provisioner "local-exec" {
    command = "az vmss identity assign -g ${data.azurerm_virtual_machine_scale_set.this.resource_group_name} -n ${data.azurerm_virtual_machine_scale_set.this.name}"
  }
}
