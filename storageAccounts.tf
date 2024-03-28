resource "azurerm_storage_account" "mudassir" {
  name                     = "mudassirdevst646378"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
  depends_on = [ azurerm_resource_group.mudassir]
}

resource "azurerm_storage_container" "mudassir" {
  name                  = "container22"
  storage_account_name  = azurerm_storage_account.mudassir.name
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.mudassir ]
}

resource "azurerm_storage_container" "mudassir1" {
  count = 5
  name                  = format("container%s", count.index)
  storage_account_name  = azurerm_storage_account.mudassir.name
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.mudassir ]
}
