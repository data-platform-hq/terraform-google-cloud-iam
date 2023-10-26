locals {
  prefix = length(var.prefix) == 0 ? "" : "${var.prefix}-"
  env    = length(var.env) == 0 ? "" : "${var.env}-"

  service_account = anytrue([var.iam_entity.special_sa, var.iam_entity.account_id == null]) ? null : "${local.prefix}${local.env}sa-${replace(var.iam_entity.account_id, "_", "-")}"

  custom_role_name = var.custom_role != null ? "${local.prefix}${local.env}${var.custom_role.name}" : null
}

resource "google_service_account" "this" {
  count = local.service_account != null ? 1 : 0

  account_id   = local.service_account
  display_name = var.iam_entity.display_name
}

resource "google_project_iam_member" "this" {
  for_each = alltrue([local.service_account != null, var.iam_entity.roles != null]) ? { for role in var.iam_entity.roles : "${var.iam_entity.account_id}-${role}" => role } : {}

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.this[0].email}"
}

resource "google_project_iam_member" "special_sa" {
  for_each = alltrue([
    local.service_account != null, var.iam_entity.special_sa, var.iam_entity.roles != null
    ]) ? {
    for role in var.iam_entity.roles : "${var.iam_entity.account_id}-${role}" => role
  } : {}

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${var.iam_entity.account_id}"
}

resource "google_project_iam_custom_role" "this" {
  count = var.custom_role != null ? 1 : 0

  role_id     = "${replace(local.custom_role_name, "-", "_")}_customrole"
  project     = var.project_id
  title       = "${local.custom_role_name} customrole"
  stage       = "GA"
  permissions = var.custom_role.permissions
}

resource "google_service_account_key" "this" {
  count = alltrue([var.iam_entity.generate_key, var.iam_entity.special_sa == false]) ? 1 : 0

  service_account_id = google_service_account.this[0].id
}


## TBD

# resource "google_project_iam_member" "custom_role_member" {
#   count = alltrue([var.iam_entity.permissions != null, var.iam_entity.custom_role == null]) ? 1 : 0

#   project = var.project_id
#   role    = google_project_iam_custom_role.this[0].id
#   member  = var.iam_entity.special_sa ? "serviceAccount:${var.iam_entity.account_id}" : "serviceAccount:${google_service_account.this[0].email}"
# }

