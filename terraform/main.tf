terraform {
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
      version = "~> 1.0"
    }
  }
}

provider "opennebula" {
  endpoint = var.one_endpoint
  username = var.one_username
  password = var.one_password
}

# Create a new image for the Go application
resource "opennebula_image" "go_app" {
  name        = "go-playground-app"
  description = "Go Playground Application Image"
  datastore_id = var.datastore_id
  path        = "docker:${var.registry_url}/go-app:latest"
  type        = "OS"
  persistent  = false
}

# Create a new image for Nginx
resource "opennebula_image" "nginx" {
  name        = "go-playground-nginx"
  description = "Nginx Reverse Proxy Image"
  datastore_id = var.datastore_id
  path        = "docker:${var.registry_url}/nginx:alpine"
  type        = "OS"
  persistent  = false
}

# Create a virtual network
resource "opennebula_virtual_network" "playground_network" {
  name        = "playground-network"
  description = "Network for Go Playground"
  bridge      = "br0"
  
  ar {
    ar_type = "IP4"
    size    = 256
    ip4     = var.network_address
  }
}

# Create a template for the application
resource "opennebula_template" "playground_template" {
  name        = "go-playground-template"
  description = "Template for Go Playground Application"
  cpu         = 1
  vcpu        = 1
  memory      = 1024

  disk {
    image_id = opennebula_image.go_app.id
    size     = 10240
  }

  disk {
    image_id = opennebula_image.nginx.id
    size     = 10240
  }

  nic {
    network_id = opennebula_virtual_network.playground_network.id
    model      = "virtio"
  }
} 