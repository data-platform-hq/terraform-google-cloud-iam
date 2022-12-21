output "composer_sa_email" {
  value       = google_service_account.composer_sa.email
  description = "E-mail address of the composer service account."
}

output "sa_email" {
  value       = { for k, v in var.sa_permissions : k => google_service_account.services_sa[k].email }
  description = "E-mail address of the service account."
}

output "sa_key" {
  value       = { for k, v in var.sa_permissions : k => base64decode(google_service_account_key.services_sa_key[k].private_key) }
  description = "Service account private key in JSON format."
}
