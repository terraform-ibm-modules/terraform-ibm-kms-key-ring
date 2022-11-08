##############################################################################
# Input Variables
##############################################################################

variable "endpoint_type" {
  type        = string
  description = "The type of endpoint to be used for creating keys, accepts 'public' or 'private'"
  default     = "public"
}

variable "instance_id" {
  type        = string
  description = "The Key Protect instance GUID"
}

variable "key_ring_id" {
  type        = string
  description = "The ID that identifies the Key Ring, each ID is unique within the given Key Protect instance but is not reserved across the Key Protect service"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{2,100}$", var.key_ring_id))
    error_message = "Key Ring ID must match regex '^[a-zA-Z0-9-]{2,100}$'."
  }
}
