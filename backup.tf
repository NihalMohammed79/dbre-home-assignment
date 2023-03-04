resource "google_storage_bucket" "toggl_backup_bucket" {
  project                     = var.project_id
  name                        = "toggl-backup-bucket-${random_id.random.dec}"
  location                    = var.bucket_location
  force_destroy               = true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  # Retains Objects for 15 Days and Prevents Deletion
  retention_policy {
    retention_period = 15 * 86400
  }

  lifecycle_rule {
    condition {
      age = 15
    }
    action {
      type = "Delete"
    }
  }
}