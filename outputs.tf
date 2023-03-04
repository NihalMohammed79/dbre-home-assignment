output "instance_names" {
  value       = google_compute_instance.toggl_compute_instance[*].name
  description = "Compute Instance Names"
}

output "instance_public_ip" {
  value       = google_compute_instance.toggl_compute_instance[*].network_interface.0.access_config.0.nat_ip
  description = "Instance External IPs"
}

output "instance_private_ip" {
  value       = google_compute_instance.toggl_compute_instance[*].network_interface.0.network_ip
  description = "Instance Internal IPs"
}

output "bucket_url" {
  value       = google_storage_bucket.toggl_backup_bucket.url
  description = "Cloud Storage Bucket URL"
}