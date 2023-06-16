terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  features {     
  }
}

resource "azurerm_subscription" "example" {
 
}
# Create resource Group
resource "azurerm_resource_group" "Default" {
}