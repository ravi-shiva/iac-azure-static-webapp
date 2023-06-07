terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.59.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "static_webapp_rg" {
  name     = "assignment"
  location = "centralus"
}

resource "azurerm_static_site" "static_webapp" {
  name                = "blog-starter"
  location            = azurerm_resource_group.static_webapp_rg.location
  resource_group_name = azurerm_resource_group.static_webapp_rg.name
}
