variable "one_endpoint" {
  description = "OpenNebula API endpoint"
  type        = string
}

variable "one_username" {
  description = "OpenNebula username"
  type        = string
}

variable "one_password" {
  description = "OpenNebula password"
  type        = string
}

variable "datastore_id" {
  description = "ID of the datastore to use"
  type        = number
}

variable "registry_url" {
  description = "Docker registry URL"
  type        = string
  default     = "registry.local"
}

variable "network_address" {
  description = "Network address for the virtual network"
  type        = string
  default     = "192.168.1.0"
} 