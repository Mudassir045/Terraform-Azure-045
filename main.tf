terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}


provider "azurerm" {
  subscription_id = "5aa7b37c-2e4b-470e-95ce-f29c458a6f50"
  client_id       = "ab3d0e89-5bbe-48f1-88ad-f61358fcb662"
  client_secret   = "GFD8Q~SN2M5yrkK6g1ZpMknaH3jSkhJr4W0sBa0M"
  tenant_id       = "1d3bdd24-8ca7-4b5a-9984-6d3cd45ee2c4"
  features {}
}



