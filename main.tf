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

# Conditionally create VNet
module "vnet" {
  source              = "./modules/vnet"
  name                = local.vnet_name
  location            = var.location
  resource_group_name = module.resource_group[0].name
  depends_on          = [module.resource_group]

  count = var.deploy_vnet ? 1 : 0
}
