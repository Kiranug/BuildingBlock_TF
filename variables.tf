variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "List of subnet address prefixes"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}


variable "cluster_name" {}
variable "dns_prefix" {}
variable "node_count" {}
variable "vm_size" {}
variable "sku_tier" {}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string  
  
}