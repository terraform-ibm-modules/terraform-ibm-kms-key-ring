variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "kms-kr"
}

variable "existing_kms_instance_guid" {
  type        = string
  description = "GUID of an existing KMS instance."
  default     = null
}
