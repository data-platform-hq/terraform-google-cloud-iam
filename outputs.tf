output "service_account_email" {
  value       = var.iam_entity.special_sa ? null : google_service_account.this[0].email
  description = "E-mail address of the service account"
}

output "service_account_key_private_key" {
  value       = alltrue([var.iam_entity.generate_key == true, var.iam_entity.special_sa == false]) ? google_service_account_key.this[0].private_key : null
  description = "Service account private key in JSON format"
}
