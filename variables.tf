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
