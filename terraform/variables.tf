variable "datastore_id" {
  description = "ID of the datastore to use"
  type        = number
  default     = 1
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