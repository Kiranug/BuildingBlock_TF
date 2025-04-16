output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = [for subnet in azurerm_subnet.subnets : subnet.name]
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for subnet in azurerm_subnet.subnets : subnet.id]
}
