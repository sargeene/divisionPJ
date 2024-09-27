resource "azurerm_virtual_network" "this_dbvnet" {
  name                = "${local.owner}-${var.dbvnet}-${local.environment}"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_virtual_network" "this_vmvnet" {
  name                = "${local.environment}-${var.vmvnet}-${local.owner}"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_virtual_network_peering" "this_vnet_peering_1to2" {
  name                      = "${local.owner}-${var.vnet_peer1to2}-${local.environment}"
  resource_group_name       = azurerm_resource_group.this_rg.name
  virtual_network_name      = azurerm_virtual_network.this_dbvnet.name
  remote_virtual_network_id = azurerm_virtual_network.this_vmvnet.id

  triggers = {
    remote_address_space = join(",", azurerm_virtual_network.this_vmvnet.address_space)
  }
  depends_on = [ azurerm_virtual_network.this_dbvnet, azurerm_virtual_network.this_vmvnet ]
}

resource "azurerm_virtual_network_peering" "this_vnet_peering_2to1" {
  name                      = "${local.owner}-${var.vnet_peer2to1}-${local.environment}"
  resource_group_name       = azurerm_resource_group.this_rg.name
  virtual_network_name      = azurerm_virtual_network.this_vmvnet.name
  remote_virtual_network_id = azurerm_virtual_network.this_dbvnet.id

  triggers = {
    remote_address_space = join(",", azurerm_virtual_network.this_dbvnet.address_space)
  }
  depends_on = [ azurerm_virtual_network.this_dbvnet, azurerm_virtual_network.this_vmvnet ]
}