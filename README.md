# Google Cloud Identity and Access Management Terraform module
Terraform module for creation of Google Cloud Identity and Access Management resources

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google)          | = 4.24.0 |
| <a name="requirement_random"></a> [random](#requirement\_random)          | >= 3.4.3 |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.24.0  |
| <a name="provider_random"></a> [random](#provider\_random) | >=3.4.3 |

## Modules
No modules.

## Resources
| Name                                                                                                                                                                     | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [google_service_account.composer_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)                              | resource |
| [google_project_iam_member.composer-worker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member) | resource |
| [google_project_iam_member.composer_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member)  | resource |
| [google_service_account.services_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)                              | resource |
| [google_project_iam_custom_role.services_sa_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)         | resource |
| [google_project_iam_member.services_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member)     | resource |
| [google_service_account_key.services_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_key)                  | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                                              | resource |

## Inputs
| Name                                                                                      | Description                                                                | Type          | Default | Required |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)                        | The ID of the project to which the resource belongs                        | `string`      | n/a     |   yes    |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number)            | The numeric identifier of the GCP project                                  | `string`      | n/a     |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)                        | `string`      | n/a     |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                               | Variable to mark the environment of the resource (used to create services) | `string`      | n/a     |   yes    |
| <a name="input_composer_roles"></a> [composer\_roles](#input\_composer\_roles)            | The role that should be applied for Composer service account               | `set(string)` | []      |   yes    |
| <a name="input_sa_permissions"></a> [sa\_permissions](#input\_sa\_permissions)            | Permissions for service accounts                                           | `map(any)`    | {}      |   yes    |

## Outputs
| Name                                                                                        | Description                                     |
| ------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| <a name="output_composer_sa_email"></a> [composer\_sa\_email](#output\_composer\_sa\_email) | E-mail address of the composer service account. |
| <a name="output_sa_email"></a> [sa\_email](#output\_sa\_email)                              | E-mail address of the service account.          |
| <a name="output_sa_key"></a> [sa\_key](#output\_sa\_key)                                    | Service account private key in JSON format.     |

<!-- END_TF_DOCS -->

## License
Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-iam/blob/main/LICENSE)
