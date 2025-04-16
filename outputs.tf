output "resource_group_name" {
  value       = var.deploy_resource_group ? module.resource_group[0].name : null
  description = "Name of the deployed resource group, if created"
}
output "resource_group_location" {
  value       = var.deploy_resource_group ? module.resource_group[0].location : null
  description = "Location of the deployed resource group, if created"
}