terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
  }
}

# Virtual Network
module "vnet" {
  source              = "./modules/vnet"
  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_prefixes
  tags = {
    environment = var.environment
  }
}

# # VM Scale Set
# module "vmss" {
#   source              = "./modules/vmss"
#   name                = var.vmss_name
#   location            = var.location
#   resource_group_name = module.resource_group.name
#   subnet_id           = module.vnet.subnet_id
# }

# # Azure Firewall
# module "firewall" {
#   source              = "./modules/firewall"
#   name                = var.firewall_name
#   location            = var.location
#   resource_group_name = module.resource_group.name
#   subnet_id           = module.vnet.subnet_id
# }
