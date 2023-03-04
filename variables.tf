variable "project_id" {
  type        = string
  description = "Google Project ID"
}

variable "credentials_path" {
  type        = string
  default     = "/files/credentials.json"
  description = "Path to Google Credential File"
}

variable "region" {
  type        = string
  default     = "europe-central2"
  description = "Region"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.123.0.0/16"
  description = "Internal Address Range"
}

variable "access_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Your Public IP Address"
}

variable "bucket_location" {
  type        = string
  default     = "EU"
  description = "Cloud Storage Bucket Location"
}

variable "email_address" {
  type        = string
  description = "Your Email Address for Notifications"
}

variable "service_account" {
  type        = string
  description = "Service Account"
}

variable "instance_type" {
  type        = string
  default     = "e2-medium"
  description = "Compute Instance Type"
}

variable "instance_image" {
  type        = string
  default     = "rocky-linux-cloud/rocky-linux-8"
  description = "Compute Instance Image"
}