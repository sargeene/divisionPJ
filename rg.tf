resource "azurerm_resource_group" "this_rg" {
  name     = "${local.owner}-${var.rg}-${local.environment}"
  location = "uksouth"
}