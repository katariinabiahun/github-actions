output "vmss_id" {
  value = data.azurerm_virtual_machine_scale_set.this.identity[0].principal_id
}