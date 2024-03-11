
# root_module/main.tf

# Define the child module
module "rgroup" {
  source = "../rgroup-HumberID" # Path to the child module directory

  # You can define input variables here if needed
}

# Output the name of the resource group from the child module
output "n01637478-RG" {
  value = module.rgroup.resource_group_name
}


module "common" {
  source              = "../common-HumberID"
  resource_group_name = azurerm_resource_group.HumberIDRG.name
  location            = "East US"
  workspace_name      = "my-workspace"
  vault_name          = "my-vault"
  // Provide values for other input variables as needed
}

// Call the network-HumberID module and pass output values as input variables
module "network" {
  source                  = "../network-HumberID"
  resource_group_name     = azurerm_resource_group.HumberIDRG.name
  resource_group_location = azurerm_resource_group.HumberIDRG.location
}








