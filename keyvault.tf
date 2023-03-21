data "azurerm_client_config" "this" {}

resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.this.tenant_id
  sku_name            = var.key_vault_sku_name
  purge_protection_enabled = false
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  soft_delete_retention_days      = var.soft_delete_retention_days

  tags = var.tags

  access_policy = [
    {
        tenant_id = data.azurerm_client_config.this.tenant_id
        object_id = data.azurerm_virtual_machine_scale_set.this.identity[0].principal_id 
        certificate_permissions = var.key_vault_certificate_permissions
        key_permissions         = var.key_vault_key_permissions
        secret_permissions      = var.key_vault_secret_permissions
        application_id = ""
        storage_permissions = []
    },
    {
        tenant_id               = data.azurerm_client_config.this.tenant_id
        object_id               = data.azurerm_client_config.this.object_id
        certificate_permissions = var.key_vault_certificate_permissions
        key_permissions         = var.key_vault_key_permissions
        secret_permissions      = var.key_vault_secret_permissions
        application_id = ""
        storage_permissions = []
    },
  ]
}

resource "azurerm_key_vault_secret" "this" {
  name         = var.key_vault_secret_name
  value        = var.key_vault_secret_value
  key_vault_id = azurerm_key_vault.this.id
}