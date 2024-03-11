resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  // Add more configuration as needed
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  // Add more configuration as needed
  sku = {
    name = "Standard"
    tier = "Standard"
  }

}

resource "azurerm_storage_account" "storage_account" {
  name                     = "your-storage-account-name"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  // Add more configuration as needed
}


