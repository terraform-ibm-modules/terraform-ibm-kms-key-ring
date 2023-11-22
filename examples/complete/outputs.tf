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

output "kms_id" {
  description = "KMS Instance ID"
  value       = ibm_resource_instance.key_protect_instance.id
}

output "kms_guid" {
  description = "KMS Instance GUID"
  value       = ibm_resource_instance.key_protect_instance.guid
}

output "kms_key_ring_id" {
  description = "KMS Key Ring ID"
  value       = module.kms_key_ring.key_ring_id
}
