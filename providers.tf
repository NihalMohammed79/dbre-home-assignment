terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.55.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
}