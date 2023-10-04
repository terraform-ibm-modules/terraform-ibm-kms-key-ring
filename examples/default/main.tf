##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.0.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

##############################################################################
# KMS(Key Protect) instance
##############################################################################

resource "ibm_resource_instance" "key_protect_instance" {
  name              = "${var.prefix}-key-protect"
  resource_group_id = module.resource_group.resource_group_id
  service           = "kms"
  plan              = "tiered-pricing"
  location          = var.region
  tags              = var.resource_tags
}

##############################################################################
# Key Ring module
##############################################################################

module "kms_key_ring" {
  source      = "../.."
  instance_id = ibm_resource_instance.key_protect_instance.guid
  key_ring_id = "${var.prefix}-key-ring"
}

##############################################################################
# Create Keys in Existing Key Rings
##############################################################################
resource "ibm_kms_key" "key" {
  instance_id   = ibm_resource_instance.key_protect_instance.guid
  key_name      = "${var.prefix}-key"
  key_ring_id   = module.kms_key_ring.key_ring_id
  standard_key  = false
  endpoint_type = "public"
  force_delete  = true
}
