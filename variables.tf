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
  If "special_sa" it's true you can add role or permission for Google-managed service accounts.
  If "role" not empty the set of predefined GCP roles will be assigned to this service account.
  If "permissions" not empty a custom role with the set of permissions will be created.
  If "generate_key" it's true the json key for service account will be created.
  EOT
  type = object({
    account_id   = string
    display_name = optional(string)
    special_sa   = optional(bool)
    role         = optional(set(string))
    permissions  = optional(set(string))
    generate_key = optional(bool)
  })
  default = {
    account_id = ""
  }
}
