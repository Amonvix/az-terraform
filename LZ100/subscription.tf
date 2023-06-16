resource "azurerm_subscription" "example" {
  alias             = var.alias
  subscription_name = var.subscription_name
  subscription_id   = var.subscription_id
}