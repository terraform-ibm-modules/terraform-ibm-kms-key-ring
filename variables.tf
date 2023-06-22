##############################################################################
# Input Variables
##############################################################################

variable "endpoint_type" {
  type        = string
  description = "The type of endpoint to be used for creating keys. Accepts 'public' or 'private'"
  default     = "public"
  validation {
    condition     = can(regex("public|private", var.endpoint_type))
    error_message = "The endpoint_type value must be 'public' or 'private'."
  }
}

variable "instance_id" {
  type        = string
  description = "The KMS instance GUID"
}

variable "key_ring_id" {
  type        = string
  description = "The ID that identifies the Key Ring. Each ID is unique within the given KMS instance but is not reserved across the KMS service"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{2,100}$", var.key_ring_id))
    error_message = "Key Ring ID must match regex '^[a-zA-Z0-9-]{2,100}$'."
  }
}
