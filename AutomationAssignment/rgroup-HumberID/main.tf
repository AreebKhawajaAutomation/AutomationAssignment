# rgroup-HumberID/main.tf

# Define the Azure provider block if not already defined
provider "azurerm" {
  features {}
}

# Define the resource group
resource "azurerm_resource_group" "HumberIDRG" {
  name     = "n01637478-RG"
  location = "East US" # Set your desired Azure region here
}

# Output the name of the resource group
output "resource_group_name" {
  value = azurerm_resource_group.HumberIDRG.name
}
