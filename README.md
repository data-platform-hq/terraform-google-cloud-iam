# Google Cloud Identity and Access Management Terraform module
Terraform module for creation of Google Cloud Identity and Access Management resources

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version   |
|---------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.84.0 |

## Providers
| Name                                                       | Version   |
|------------------------------------------------------------|-----------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.84.0 |

## Modules
No modules.

## Resources
| Name                                                                                                                                                                        | Type     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)                                        | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member)               | resource |
| [google_project_iam_member.special_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member)         | resource |
| [google_project_iam_custom_role.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)                        | resource |
| [google_service_account_key.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_key)                                | resource |
| [google_project_iam_member.custom_role_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member) | resource |

## Inputs
| Name                                                                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                               | Type     | Default                                                                                                                                                                                                    | Required |
|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)    | ID of the project in which the resources should be created.                                                                                                                                                                                                                                                                                                                                                                                               | `string` | n/a                                                                                                                                                                                                        |   yes    |
| <a name="input_env"></a> [env](#input\_env)                           | Variable to mark the environment of the resource (used to create services).                                                                                                                                                                                                                                                                                                                                                                               | `string` | n/a                                                                                                                                                                                                        |   yes    |
| <a name="input_prefix"></a> [prefix](#input\_prefix)                  | Prefix for resource names                                                                                                                                                                                                                                                                                                                                                                                                                                 | `string` | ""                                                                                                                                                                                                         |    no    |
| <a name="input_iam_entity"></a> [iam\_entity](#input\_iam\_entity)    | IAM entities with roles and permissions. An "account_id" is used for username part of email for new service account <br><account_id>@<project_id>.iam.gserviceaccount.com. If "special_sa" is true you can add role or permission for <br>Google-managed service accounts. If "roles" not empty the set of predefined GCP roles will be assigned to this <br>service account. If "generate_key" is true the json key for service account will be created. | `object` | <pre>({<br>  account_id = string<br>  display_name = optional(string)<br>  special_sa = optional(bool)<br>  roles = optional(set(string))<br>  generate_key = optional(bool)<br>})<br>default = null</pre> |    no    |
| <a name="input_custom_role"></a> [custom\_role](#input\_custom\_role) | IAM custom role and permissions                                                                                                                                                                                                                                                                                                                                                                                                                           | `object` | <pre>({<br>  name = string<br>  permissions = set(string)<br>})<br>default = null</pre>                                                                                                                    |    no    |


## Outputs
| Name                                                                                                                                     | Description                                 |
|------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------|
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email)                                  | E-mail address of the service account.      |
| <a name="output_service_account_key_private_key"></a> [service\_account\_key\_private_key](#output\_service\_account\_key\_private\_key) | Service account private key in JSON format. |

<!-- END_TF_DOCS -->

## License
Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-iam/blob/main/LICENSE)
