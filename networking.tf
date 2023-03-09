resource "google_compute_network" "toggl_network" {
  project                 = var.project_id
  name                    = "toggl-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "toggl_subnet" {
  name          = "toggl-subnet"
  ip_cidr_range = var.vpc_cidr
  region        = var.region
  network       = google_compute_network.toggl_network.id
}

# Firewall Rules
resource "google_compute_firewall" "private_access" {
  name          = "toggl-private-access-firewall"
  network       = google_compute_network.toggl_network.id
  source_ranges = [var.vpc_cidr]
  description   = "Creates Firewall Rule for Private Access between Nodes"

  allow {
    protocol = "tcp"
    ports    = ["22", "5432"]
  }
}

resource "google_compute_firewall" "public_access" {
  name          = "toggl-public-access-firewall"
  network       = google_compute_network.toggl_network.id
  source_ranges = [var.access_ip]
  description   = "Creates Firewall Rule for Public Access"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}