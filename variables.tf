variable "project_id" {
  description = "ID of the project in which the resources should be created."
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resources (used to create resources names)"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = ""
}

variable "iam_entity" {
  description = <<-EOT
  IAM entities with roles and permissions. 
  "account_id" is used for username part of email for new service account <account_id>@<project_id>.iam.gserviceaccount.com.
  If "special_sa" is true you can add role or permission for Google-managed service accounts.
  If "roles" not empty the set of predefined GCP roles will be assigned to this service account.
  If "generate_key" is true the json key for service account will be created.
  EOT
  type = object({
    account_id   = string
    display_name = optional(string)
    special_sa   = optional(bool, false)
    roles        = optional(set(string))
    generate_key = optional(bool, false)
  })
  default = null
}

variable "custom_role" {
  description = "IAM custom role and permissions"
  type = object({
    name        = string
    permissions = set(string)
  })
  default = null
}
