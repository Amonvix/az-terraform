# Create resource Group
resource "azurerm_resource_group" "Default" {
    name = var.rg_name
    location = var.rg_location       
}