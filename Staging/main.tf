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

# Create Virtual Network
resource "azurerm_virtual_network" "Default" {
  name = "vnet-ign-dap"
  address_space = [ "10.0.0.0/16" ]
  location = "eastus"
  resource_group_name = azurerm_resource_group.Default.name   
}

resource "azurerm_subnet" "internal" {
  name = "internal"
  resource_group_name = azurerm_resource_group.Default.name
  virtual_network_name = azurerm_virtual_network.Default.name
  address_prefixes = [ "10.0.1.0/24" ]
}