output "composer_sa_email" {
  value       = google_service_account.composer_sa.email
  description = "Service account for composer"
}

output "raw_serverless_sa_email" {
  value       = google_service_account.services_sa["raw_serverless"].email
  description = "raw_serverless service account email"
}

output "raw_spark_sa_email" {
  value       = google_service_account.services_sa["raw_spark"].email
  description = "raw_spark service account email"
}

output "dp_serverless_sa_email" {
  value       = google_service_account.services_sa["dp_serverless"].email
  description = "dp_serverless service account email"
}

output "dp_spark_sa_email" {
  value       = google_service_account.services_sa["dp_spark"].email
  description = "dp_spark service account email"
}

output "raw_serverless_sa_key" {
  value       = google_service_account_key.services_sa_key["raw_serverless"].private_key
  description = "raw_serverless service account key"
}

output "raw_spark_sa_key" {
  value       = google_service_account_key.services_sa_key["raw_spark"].private_key
  description = "raw_spark service account key"
}

output "dp_serverless_sa_key" {
  value       = google_service_account_key.services_sa_key["dp_serverless"].private_key
  description = "dp_serverless service account key"
}

output "dp_spark_sa_key" {
  value       = google_service_account_key.services_sa_key["dp_spark"].private_key
  description = "dp_spark service account key"
}
