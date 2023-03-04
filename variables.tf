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