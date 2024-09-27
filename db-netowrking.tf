
resource "azurerm_subnet" "this_dbsubnet" {
  name                 = "${local.owner}-${var.dbsubnet}-${local.environment}"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_dbvnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_network_interface" "this_dbnic" {
  name                = "${local.owner}-${var.dbnic}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this_dbsubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_private_endpoint" "this_db_private_endpoint" {
  name                = "${local.owner}-${var.db_private_endoint}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
  subnet_id           = azurerm_subnet.this_dbsubnet.id

  private_service_connection {
    name                           = var.db_private_service_connection
    private_connection_resource_id = azurerm_mysql_flexible_server.this_mysql_flexible_server.id
    subresource_names              = ["mysqlserver"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.db_private_dns_group
    private_dns_zone_ids = [azurerm_private_dns_zone.db_private_dns_zone.id]
  }
}

resource "azurerm_private_dns_zone" "this_db_private_dns_zone" {
  name                = var.db_private_dns_zone
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this_db_private_dns_zone_virtual_network_link" {
  name                  = var.db_private_dns_vnet_link
  resource_group_name   = azurerm_resource_group.this_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.this_db_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.this_dbvnet.id
}