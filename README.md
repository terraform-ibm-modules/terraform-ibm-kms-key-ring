# KMS key ring module

[![Stable (With Quality Checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green?style=plastic)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-kms-key-ring?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-kms-key-ring/releases/latest)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

This module creates a key ring to help organize keys in a KMS instance. KMS can be Key Protect or Hyper Protect Crypto Services(HPCS) instance.
For more information, about key management rings, see [creating key rings in Key Protect](https://cloud.ibm.com/docs/key-protect?topic=key-protect-grouping-keys#create-key-ring-api) and [managing key rings in HPCS](https://cloud.ibm.com/docs/hs-crypto?topic=hs-crypto-managing-key-rings&interface=ui).

## Usage
```hcl
provider "ibm" {
  ibmcloud_api_key = "XXXXXXXXXX"
  # Must be the same region the KMS instance is in
  region           = "us-south"
}

module "kms_key_ring" {
  source  = "terraform-ibm-modules/kms-key-ring/ibm"
  version = "latest" # Replace "latest" with a release version to lock into a specific release
  instance_id   = "XXxxXXxx-xxxx-XXXX-xxxx-XXxxXXxx"
  key_ring_id   = "my-key-ring"
}
```

## Required IAM access policies
You need the following permissions to run this module.

- Account Management
    - **Resource Group** service
        - `Viewer` platform access
- IAM Services
    - **KMS** service
        - `Viewer` platform access
        - `Manager` service access


<!-- END MODULE HOOK -->
<!-- BEGIN EXAMPLES HOOK -->
## Examples

- [ End to end example with default values](examples/default)
- [ An example that uses existing KMS](examples/existing-kms)
<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_kms_key_rings.key_ring](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/kms_key_rings) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | The type of endpoint to be used for creating keys. Accepts 'public' or 'private' | `string` | `"public"` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The KMS instance GUID | `string` | n/a | yes |
| <a name="input_key_ring_id"></a> [key\_ring\_id](#input\_key\_ring\_id) | The ID that identifies the Key Ring. Each ID is unique within the given KMS instance but is not reserved across the KMS service | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_ring_id"></a> [key\_ring\_id](#output\_key\_ring\_id) | ID of the Key Ring |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
