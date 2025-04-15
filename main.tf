terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "random" {}

# Generate a random suffix for naming
resource "random_id" "common" {
  byte_length = 2
}

locals {
  suffix = random_id.common.hex

  resource_group_name = "${var.environment}-${var.location}-rg-${local.suffix}"
  vnet_name           = "${var.environment}-${var.location}-vnet-${local.suffix}"
  storage_name        = lower("st${local.suffix}")
}

# Conditionally create resource group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = local.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
  }

  count = var.deploy_rg ? 1 : 0
}

# Conditionally create virtual network
module "vnet" {
  source   = "./modules/vnet"
  name     = local.vnet_name
  location = var.location
  resource_group_name = module.resource_group[0].name
  address_space       = var.vnet_address_space

  count = var.deploy_vnet ? 1 : 0
 }

# # Conditionally create VM scale set
# module "vmss" {
#   source   = "./modules/vmss"
#   name     = "${var.environment}-${var.location}-vmss-${local.suffix}"
#   location = var.location
#   resource_group_name = module.resource_group[0].name
#   subnet_id           = module.vnet[0].subnet_id

#   count = var.deploy_vmss ? 1 : 0
# }

# # Conditionally create firewall
# module "firewall" {
#   source   = "./modules/firewall"
#   name     = "${var.environment}-${var.location}-fw-${local.suffix}"
#   location = var.location
#   resource_group_name = module.resource_group[0].name
#   subnet_id           = module.vnet[0].subnet_id

#   count = var.deploy_firewall ? 1 : 0
# }