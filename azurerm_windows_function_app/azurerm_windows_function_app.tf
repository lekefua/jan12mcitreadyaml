variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_web_name" {
  description = "Name of the Web Subnet"
  type        = string
}

variable "subnet_app_name" {
  description = "Name of the Application Subnet"
  type        = string
}

variable "subnet_db_name" {
  description = "Name of the Database Subnet"
  type        = string
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "web" {
  name                 = var.subnet_web_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = var.subnet_app_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "db" {
  name                 = var.subnet_db_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.3.0/24"]
}
module "central_three_tier_app" {
  source              = "./centralized_modules/three_tier_app"
  resource_group_name = "example-resource-group"
  location            = "East US"
  vnet_name           = "example-vnet"
  subnet_web_name     = "web-subnet"
  subnet_app_name     = "app-subnet"
  subnet_db_name      = "db-subnet"
}

