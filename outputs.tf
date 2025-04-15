output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_name" {
  description = "The name of the created virtual network"
  value       = module.vnet.name
}

# Add more outputs as needed