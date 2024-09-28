data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "this_keyvault" {
  name                       = "${local.owner}-${var.key_vault}-${local.environment}"
  location                   = azurerm_resource_group.this_rg.location
  resource_group_name        = azurerm_resource_group.this_rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = ["82.6.69.66"] #system IP
    virtual_network_subnet_ids = []
  }
}

resource "azurerm_key_vault_access_policy" "this_rasheed_access_policy" {
  key_vault_id = azurerm_key_vault.this_keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "32f8356a-aee0-4b56-804a-2e56a7ea610c"

 
  secret_permissions = [
    "Get",
    "Delete",
    "List",
    "set"
  ]
}

resource "azurerm_key_vault_access_policy" "this_user_assigned_identity" {
  key_vault_id = azurerm_key_vault.this_keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.this_managedidentity.principal_id

  secret_permissions = [
    "Get"
  ]
}

resource "azurerm_key_vault_secret" "this_vm_secret" {
  name         = "${local.owner}-${var.vm_secret}-${local.environment}"
  value        = random_password.this_password.result
  key_vault_id = azurerm_key_vault.this_keyvault.id
}
resource "azurerm_key_vault_secret" "this_felxible_Server_secret" {
  name         = "${local.owner}-${var.flexible_server_secret}-${local.environment}"
  value        = random_password.this_password.result
  key_vault_id = azurerm_key_vault.this_keyvault.id
}