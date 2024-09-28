resource "azurerm_network_security_group" "this_vm_nsg" {
  name                = "${local.owner}-${var.vm_nsg}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_network_security_rule" "this_vm_inbound_ns_rule" {
  name                       = "${local.owner}-${var.vm_inbound_ns_rule}-${local.environment}"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3389" #443
  source_address_prefix      = "AzureBastion" #or "AzureBastionSubnet"
  destination_address_prefix = azurerm_private_endpoint.this_db_private_endpoint.private_service_connection[0].private_ip_address
  # [0] in line above means it should grab the first IP address of the private endpoint
  resource_group_name         = azurerm_resource_group.this_rg.name
  network_security_group_name = azurerm_network_security_group.this_vm_nsg.id
}
resource "azurerm_network_security_rule" "this_vm_outbound_ns_rule" {
  name                        = "${local.owner}-${var.vm_outbound_ns_rule}-${local.environment}"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork" # or "10.1.0.0/16" Vnet of db
  resource_group_name         = azurerm_resource_group.this_rg.name
  network_security_group_name = azurerm_network_security_group.this_vm_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "this_vm_nsg_association" {
  subnet_id                 = azurerm_subnet.this_vmsubnet.id
  network_security_group_id = azurerm_network_security_group.this_vm_nsg.id
}