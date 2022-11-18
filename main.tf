resource "random_string" "main" {
  length  = 5
  special = false
}

# Composer service account
resource "google_service_account" "composer_sa" {
  account_id   = "${var.env}-${var.product_base_name}-composer"
  display_name = "${var.env}-${var.product_base_name}-composer"
}

resource "google_project_iam_member" "composer-worker" {
  project  = var.project_id
  for_each = var.composer_roles
  role     = each.key
  member   = "serviceAccount:${google_service_account.composer_sa.email}"
}

resource "google_project_iam_member" "composer_agent" {
  project = var.project_id
  role    = "roles/composer.ServiceAgentV2Ext"
  member  = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}


## Service accounts
resource "google_service_account" "services_sa" {
  for_each     = var.sa_permissions
  account_id   = replace("${var.env}-${var.product_base_name}-${each.key}", "_", "-")
  display_name = "${var.env}-${var.product_base_name}-${each.key}-sa"
}

resource "google_project_iam_custom_role" "services_sa_role" {
  for_each    = var.sa_permissions
  role_id     = replace("${var.env}-${var.product_base_name}-${each.key}-${random_string.main.result}", "-", "_")
  title       = "${var.env}-${var.product_base_name}-${each.key} Role"
  permissions = each.value
}

resource "google_project_iam_member" "services_sa" {
  project  = var.project_id
  for_each = var.sa_permissions
  role     = google_project_iam_custom_role.services_sa_role[each.key].id
  member   = "serviceAccount:${google_service_account.services_sa[each.key].email}"
}

resource "google_service_account_key" "services_sa_key" {
  for_each           = var.sa_permissions
  service_account_id = google_service_account.services_sa[each.key].email
}
