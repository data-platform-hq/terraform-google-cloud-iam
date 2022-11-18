variable "project_id" {
  description = "The ID of the project to which the resource belongs"
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
  default     = ["roles/datapipelines.serviceAgent", "roles/secretmanager.secretAccessor", "roles/composer.worker", "roles/bigquery.dataEditor"]
}

variable "sa_permissions" {
  description = "Permissions for service accounts"
  type        = map(any)
  default = {
    raw_serverless = ["bigquery.datasets.get", "bigquery.tables.create", "bigquery.tables.get", "bigquery.tables.list", "dataflow.jobs.get", "dataflow.jobs.list", "iam.serviceAccounts.actAs", "secretmanager.versions.access", "storage.buckets.get", "storage.objects.get", "storage.objects.list"]
    dp_serverless  = ["bigquery.jobs.create", "bigquery.tables.create", "bigquery.tables.delete", "bigquery.tables.getData", "bigquery.tables.updateData", "storage.objects.get", "storage.objects.list"]
    raw_spark      = ["bigquery.jobs.create", "bigquery.tables.create", "bigquery.tables.delete", "bigquery.tables.get", "bigquery.tables.update", "bigquery.tables.updateData", "dataproc.agents.create", "dataproc.agents.delete", "dataproc.agents.get", "dataproc.agents.list", "dataproc.agents.update", "dataproc.clusters.create", "dataproc.clusters.delete", "dataproc.clusters.use", "dataproc.jobs.create", "dataproc.jobs.get", "dataproc.operations.get", "dataproc.operations.list", "dataproc.tasks.lease", "dataproc.tasks.listInvalidatedLeases", "dataproc.tasks.reportStatus", "iam.serviceAccounts.actAs", "iam.serviceAccounts.get", "secretmanager.versions.access", "storage.objects.create", "storage.buckets.get", "storage.objects.delete", "storage.objects.get", "storage.objects.list"]
    dp_spark       = ["bigquery.jobs.create", "bigquery.tables.create", "bigquery.tables.delete", "bigquery.tables.get", "bigquery.tables.update", "bigquery.tables.updateData", "dataproc.agents.create", "dataproc.agents.delete", "dataproc.agents.get", "dataproc.agents.list", "dataproc.agents.update", "dataproc.clusters.create", "dataproc.clusters.delete", "dataproc.clusters.use", "dataproc.jobs.create", "dataproc.jobs.get", "dataproc.operations.get", "dataproc.operations.list", "dataproc.tasks.lease", "dataproc.tasks.listInvalidatedLeases", "dataproc.tasks.reportStatus", "iam.serviceAccounts.actAs", "storage.objects.create", "storage.objects.delete", "storage.objects.get", "storage.objects.list", "storage.buckets.get"]
  }
}
