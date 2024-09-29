resource "azurerm_subnet" "this_vmsubnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vmvnet.name
  address_prefixes     = ["10.2.2.0/24"]
}

resource "azurerm_network_interface" "this_vmnic" {
  name                = "${local.owner}-${var.vmnic}-${local.environment}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this_vmsubnet.id
    private_ip_address_allocation = "Dynamic"
    #private_ip_address            = "10.0.2.9"
  }
}