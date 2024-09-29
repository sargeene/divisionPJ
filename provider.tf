terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  # use_cli = true
   subscription_id = var.subscription-id
  # client_id       = "your_client_id"        # Optional if using environment variables
  # client_secret   = "your_client_secret"    # Optional if using environment variables
  # tenant_id       = "your_tenant_id"        # Optional if using environment variables
}
provider "random" {
  # Configuration options
}