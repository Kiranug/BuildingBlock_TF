output "resource_group_name" {
  value = module.resource_group[0].name
}

output "vnet_name" {
  description = "The name of the created virtual network"
  value       = module.vnet.vnet_name
}