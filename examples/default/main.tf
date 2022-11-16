##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.3"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

##############################################################################
# Key Protect module
##############################################################################

module "key_protect_module" {
  source            = "git::https://github.com/terraform-ibm-modules/terraform-ibm-key-protect.git?ref=v1.1.0"
  key_protect_name  = "${var.prefix}-kp"
  resource_group_id = module.resource_group.resource_group_id
  region            = var.region
  tags              = var.resource_tags
}

##############################################################################
# Key Ring module
##############################################################################

module "key_protect_key_ring" {
  source        = "../.."
  instance_id   = module.key_protect_module.key_protect_guid
  key_ring_id   = "${var.prefix}-key-ring"
  endpoint_type = "public"
}
