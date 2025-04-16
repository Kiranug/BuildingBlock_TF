output "vnet_name" {
  value = module.vnet.vnet_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_names" {
  value = module.vnet.subnet_names
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}

output "resource_group_name" {
  value = module.resource_group.name  
}