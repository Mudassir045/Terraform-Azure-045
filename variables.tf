variable "subscription_id" {
  type = string
  sensitive = true
}

variable "tenant_id" {
  type = string
  sensitive = true
}

variable "client_id" {
  type = string
  sensitive = true
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "resource_group_name" {
  type=string
  description="This defines the resource group name"
}

variable "location" {
  type=string
  description="This defines the location"
}

variable "virtual_network_name" {
  type=string
  description="This defines the name of the virtual network"
}

variable "virtual_network_address_space" {
  type=string
  description="This defines the address space of the virtual network"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "container_name" {
  type = string
}