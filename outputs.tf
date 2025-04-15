output "resource_group_name" {
  value = module.resource_group[0].name // Access the first element in the list
}

output "vnet_name" {
  description = "The name of the created virtual network"
  value       = module.vnet.vnet_name // Use the correct output from the vnet module
}