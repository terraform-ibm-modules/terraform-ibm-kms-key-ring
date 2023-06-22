##############################################################################
# KMS Key Ring module
##############################################################################

resource "ibm_kms_key_rings" "key_ring" {
  endpoint_type = var.endpoint_type
  instance_id   = var.instance_id
  key_ring_id   = var.key_ring_id
}
