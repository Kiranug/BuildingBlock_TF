resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = var.aks_kubelet_identity_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.this.id
}
