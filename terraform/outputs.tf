output "template_id" {
  description = "ID of the created template"
  value       = opennebula_template.playground_template.id
}

output "network_id" {
  description = "ID of the created network"
  value       = opennebula_virtual_network.playground_network.id
} 