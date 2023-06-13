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

# Defined BackEnd
terraform {
  backend "azurerm" {
    resource_group_name = "teste-ign-dap"
    storage_account_name = "ignitestate"
    container_name = "tf-state"
    key = "staging.terraform.tfstate"
  }
}

# Create resource Group
resource "azurerm_resource_group" "Default" {
    name = "teste-ign-dap"
    location = "eastus"
    tags = {
        "managedBy":"terraform"
        "createdBy":"daniel.pedroso"
        "team":"CloudServices"
    }     
}