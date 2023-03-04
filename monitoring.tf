resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Notification"
  type         = "email"

  labels = {
    email_address = var.email_address
  }
}

resource "google_monitoring_alert_policy" "high_cpu_usage_alert_policy" {
  display_name          = "High CPU Usage on Primary DB"
  combiner              = "OR"
  notification_channels = [google_monitoring_notification_channel.email.name]

  conditions {
    display_name = "High CPU Usage on Primary DB"

    condition_threshold {
      threshold_value = "0.9"
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\" resource.label.\"instance_id\"=\"${google_compute_instance.toggl_compute_instance[0].id}\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }
}

resource "google_monitoring_alert_policy" "high_disk_usage_alert_policy" {
  display_name          = "High Disk Usage on Primary DB"
  combiner              = "OR"
  notification_channels = [google_monitoring_notification_channel.email.name]

  conditions {
    display_name = "High Disk Usage on Primary DB"

    condition_threshold {
      threshold_value = "85"
      filter          = "metric.type=\"compute.googleapis.com/guest/disk/bytes_used\" AND resource.type=\"gce_instance\" resource.label.\"instance_id\"=\"${google_compute_instance.toggl_compute_instance[0].id}\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }
}