variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "deploy_rg" {
  description = "Whether to deploy the resource group"
  type        = bool
  default     = false
}

variable "deploy_vnet" {
  description = "Whether to deploy the virtual network"
  type        = bool
  default     = false
}

variable "deploy_vmss" {
  description = "Whether to deploy the VM scale set"
  type        = bool
  default     = false
}

variable "deploy_firewall" {
  description = "Whether to deploy the firewall"
  type        = bool
  default     = false
}

variable "deploy_resource_group" {
  description = "Whether to deploy the resource group"
  type        = bool
  default     = false
}