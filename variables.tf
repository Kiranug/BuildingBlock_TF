variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

# Feature flags for conditional deployment
variable "deploy_rg" {
  type    = bool
  default = false
}

variable "deploy_vnet" {
  type    = bool
  default = false
}

# Add more flags like deploy_vm, deploy_aks etc.
