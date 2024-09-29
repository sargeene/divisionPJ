resource "azurerm_network_security_group" "this_dbnsg" {
  name                = "${local.owner}-${var.db_nsg}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
  }

resource "azurerm_network_security_rule" "this_db_nsg_rule" {
  name                        = "${local.owner}-${var.db_nsg_rule}-${local.environment}"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = azurerm_network_interface.this_dbnic.private_ip_address
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.this_rg.name
  network_security_group_name = azurerm_network_security_group.this_dbnsg.name
}

resource "azurerm_network_interface_security_group_association" "this_subnet_nsg_association" {
  network_interface_id      = azurerm_network_interface.this_dbnic.id
  network_security_group_id = azurerm_network_security_group.this_dbnsg.id
}
