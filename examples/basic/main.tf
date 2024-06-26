##############################################################################
# Key Ring module
##############################################################################

module "kms_key_ring" {
  source       = "../.."
  instance_id  = var.existing_kms_instance_guid
  key_ring_id  = "${var.prefix}-key-ring"
  force_delete = true # Setting it to true for testing purpose
}
