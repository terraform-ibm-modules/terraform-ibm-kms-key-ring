##############################################################################
# Outputs
##############################################################################

output "kms_key_ring_id" {
  description = "KMS Key Ring ID"
  value       = module.kms_key_ring.key_ring_id
}
