# network-HumberID/main.tf

# Define the virtual network
resource "azurerm_virtual_network" "HumberID-VNET" {
  name                = "HumberID-VNET"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

# Define the subnet
resource "azurerm_subnet" "HumberID-SUBNET" {
  name                 = "HumberID-SUBNET"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.HumberID-VNET.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Define the network security group
resource "azurerm_network_security_group" "HumberID-NSG" {
  name                = "HumberID-NSG"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  # Define inbound security rules
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the network security group with the subnet
resource "azurerm_subnet_network_security_group_association" "HumberID-SUBNET-NSG" {
  subnet_id                 = azurerm_subnet.HumberID-SUBNET.id
  network_security_group_id = azurerm_network_security_group.HumberID-NSG.id
}

# Output the names of the virtual network and subnet
output "virtual_network_name" {
  value = azurerm_virtual_network.HumberID-VNET.name
}

output "subnet_name" {
  value = azurerm_subnet.HumberID-SUBNET.name
}
