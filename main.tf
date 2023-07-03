locals {
  prefix          = length(var.prefix) == 0 ? "" : "${replace(var.prefix, "-", "_")}"
  env             = length(var.env) == 0 ? "" : "${replace(var.env, "-", "_")}"
  service_account = var.iam_entity.special_sa ? null : "${var.prefix}-${var.env}-${replace(var.iam_entity.account_id, "-", "")}-sa"
  custom_role     = var.iam_entity.permissions != null ? "${local.prefix}${local.env}${replace(var.iam_entity.account_id, "-", "_")}" : null
}

resource "google_service_account" "this" {
  count = local.service_account != null ? 1 : 0

  account_id   = local.service_account
  display_name = var.iam_entity.description
}

resource "google_project_iam_member" "this" {
  for_each = { for role in var.iam_entity.role : "${var.iam_entity.account_id}-${role}" => role if local.service_account != null }

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.this[0].email}"
}

resource "google_project_iam_member" "special_sa" {
  for_each = { for role in var.iam_entity.role : "${var.iam_entity.account_id}-${role}" => role if alltrue([var.iam_entity.role != null, var.iam_entity.special_sa]) }

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${var.iam_entity.account_id}"
}

resource "google_project_iam_custom_role" "this" {
  count = var.iam_entity.permissions != null ? 1 : 0

  role_id     = "${local.custom_role}_customrole"
  project     = var.project_id
  title       = "${local.custom_role}-customrole"
  stage       = "GA"
  permissions = var.iam_entity.permissions
}

resource "google_project_iam_member" "custom_role_member" {
  count = var.iam_entity.permissions != null ? 1 : 0

  project = var.project_id
  role    = google_project_iam_custom_role.this[0].id
  member  = var.iam_entity.special_sa ? "serviceAccount:${var.iam_entity.account_id}" : "serviceAccount:${google_service_account.this[0].email}"
}

resource "google_service_account_key" "this" {
  count = alltrue([var.iam_entity.generate_key == true, var.iam_entity.special_sa == false]) ? 1 : 0

  service_account_id = google_service_account.this[0].id
}
