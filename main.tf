resource "azurerm_resource_group" "mudassir" {
  name     = var.resource_group_name
  location = var.location  
}

resource "azurerm_virtual_network" "mudassir" {
  name                = var.virtual_network_name
  location            = var.location  
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_space]
  depends_on = [
    azurerm_resource_group.mudassir
  ]  
} 


resource "azurerm_subnet" "mudassir" {    
    name                 = "SubnetA"
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    address_prefixes     = ["10.0.0.0/24"]
    depends_on = [
      azurerm_virtual_network.mudassir
    ]
}

resource "azurerm_network_security_group" "mudassir" {
  name                = "DEV-NSG-01"
  location            = var.location 
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

depends_on = [
    azurerm_virtual_network.mudassir
  ]
}

resource "azurerm_subnet_network_security_group_association" "mudassir" {  
  subnet_id                 = azurerm_subnet.mudassir.id
  network_security_group_id = azurerm_network_security_group.mudassir.id

  depends_on = [
    azurerm_virtual_network.mudassir,
    azurerm_network_security_group.mudassir
  ]
}

