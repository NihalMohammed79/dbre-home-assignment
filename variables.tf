variable "project_id" {
  type        = string
  description = "Google Project ID"
}

variable "credentials_path" {
  type        = string
  description = "Path to Google Credential File"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "vpc_cidr" {
  type        = string
  description = "Internal Address Range"
}

variable "access_ip" {
  type        = string
  description = "Your Public IP Address"
}

variable "bucket_location" {
  type        = string
  default     = "EU"
  description = "Cloud Storage Bucket Location"
}

variable "bucket_name" {
  type        = string
  description = "A Unique Name for the Cloud Storage Bucket"
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
  description = "Compute Instance Type"
}

variable "instance_image" {
  type        = string
  description = "Compute Instance Image"
}

variable "ssh_user" {
  type        = string
  description = "ssh User"
}

variable "public_key_path" {
  type        = string
  description = "Path To Public SSH Key"
}