
resource "azurerm_network_interface" "mudassir" {
  name                = "DEV-VM-002-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mudassir.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ azurerm_subnet.mudassir ]
}

resource "azurerm_windows_virtual_machine" "mudassir" {
  name                = "DEV-VM-002"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.mudassir.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  depends_on = [ azurerm_network_interface.mudassir,
  azurerm_resource_group.mudassir ]
}