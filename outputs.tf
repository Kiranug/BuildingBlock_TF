output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.vnet.vnet_name
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = module.vnet.vnet_id
}

output "subnet_names" {
  description = "The names of the subnets"
  value       = module.vnet.subnet_names
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.vnet.subnet_ids
}
