output "resource_group_name" {
  value = module.resource_group[0].name // Access the first element in the list
}
