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
   subscription_id = "32f8356a-aee0-4b56-804a-2e56a7ea610c"
  # client_id       = "your_client_id"        # Optional if using environment variables
  # client_secret   = "your_client_secret"    # Optional if using environment variables
  # tenant_id       = "9a09f19b-c5d0-43c1-a593-c35c689354c3"        # Optional if using environment variables
}
provider "random" {
  # Configuration options
}