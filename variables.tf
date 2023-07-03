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

variable "suffix" {
  description = "Suffix for resource names"
  type        = string
  default     = ""
}

variable "iam_entity" {
  description = "IAM entity with roles and permissions"
  type = object({
    account_id   = string
    description  = optional(string)
    special_sa   = optional(bool)
    role         = optional(set(string))
    permissions  = optional(set(string))
    generate_key = optional(bool)
  })
  default = {
    account_id = ""
  }
}
