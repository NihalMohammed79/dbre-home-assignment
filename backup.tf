resource "google_storage_bucket" "toggl_backup_bucket" {
  project                     = var.project_id
  name                        = var.bucket_name
  location                    = var.bucket_location
  force_destroy               = true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  # Retains Objects for 15 Days and Prevents Deletion
  retention_policy {
    retention_period = 15 * 86400
  }

  # Deletes Objects after 15 Days
  lifecycle_rule {
    condition {
      age = 15
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_iam_member" "toggl_backup_bucket_permissions" {
  bucket = google_storage_bucket.toggl_backup_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service_account}"
}