variable "project_id" {
  description = "ID of the project in which the resources should be created."
  type        = string
}

variable "project_number" {
  description = "The numeric identifier of the GCP project"
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "composer_roles" {
  description = "The role that should be applied for Composer service account"
  type        = set(string)
  default     = []
}

variable "sa_permissions" {
  description = "Permissions for sarvice accounts"
  type        = map(any)
  default     = {}
}
