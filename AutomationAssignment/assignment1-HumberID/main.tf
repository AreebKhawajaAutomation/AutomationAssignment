# Define child modules
module "rgroup" {
  source = "./rgroup-HumberID"
  resource_group_name = var.rgroup_resource_group_name
  # Define other input variables for rgroup module
}

module "network" {
  source = "./network-HumberID"
  virtual_network_name = var.network_virtual_network_name
  # Define other input variables for network module
}

module "common" {
  source = "./common-HumberID"
  workspace_name = var.common_workspace_name
  # Define other input variables for common module
}

module "vmlinux" {
  source = "./vmlinux-HumberID"
  # Define input variables for vmlinux module
  # For example:
  # count = 3
}

module "vmwindows" {
  source = "./vmwindows-HumberID"
  # Define input variables for vmwindows module
}

module "datadisk" {
  source = "./datadisk-HumberID"
  # Define input variables for datadisk module
}

module "loadbalancer" {
  source = "./loadbalancer-HumberID"
  # Define input variables for loadbalancer module
}

module "database" {
  source = "./database-HumberID"
  # Define input variables for database module
}

# Define outputs for child modules
output "rgroup_output" {
  value = module.rgroup.resource_group_name
}

output "network_output" {
  value = module.network.virtual_network_name
}

output "common_output" {
  value = module.common.workspace_name
}

output "vmlinux_output" {
  value = module.vmlinux.vm_hostnames
  # Define outputs for vmlinux module
}

output "vmwindows_output" {
  value = module.vmwindows.vm_hostname
  # Define outputs for vmwindows module
}

output "datadisk_output" {
  value = module.datadisk.some_output_variable
  # Define outputs for datadisk module
}

output "loadbalancer_output" {
  value = module.loadbalancer.load_balancer_name
  # Define outputs for loadbalancer module
}

output "database_output" {
  value = module.database.database_instance_name
  # Define outputs for database module
}
