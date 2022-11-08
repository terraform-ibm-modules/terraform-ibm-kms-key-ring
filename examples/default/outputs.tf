##############################################################################
# Outputs
##############################################################################

output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = module.resource_group.resource_group_id
}

output "key_protect_id" {
  description = "Key Protect Instance ID"
  value       = module.key_protect_module.key_protect_guid
}

output "key_protect_key_ring_id" {
  description = "Key Protect Key Ring ID"
  value       = module.key_protect_key_ring.key_ring_id
}
