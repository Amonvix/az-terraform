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

data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "example_parent" {
  display_name = "ParentGroup"

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "example_child" {
  display_name               = "ChildGroup"
  parent_management_group_id = azurerm_management_group.example_parent.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

# Create resource Group
resource "azurerm_resource_group" "Default" {
    name = "landing-ign-dap"
    location = "eastus"
    tags = {
        "managedBy":"terraform"
        "createdBy":"daniel.pedroso"
        "team":"InnovateOne"
    }     
}

resource "azurerm_subscription" "example" {
  alias             = "examplesub"
  subscription_name = "My Example Subscription"
  subscription_id   = "12345678-12234-5678-9012-123456789012"
}