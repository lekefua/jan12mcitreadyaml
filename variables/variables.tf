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

