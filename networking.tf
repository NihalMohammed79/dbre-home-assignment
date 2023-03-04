resource "random_id" "random" {
  byte_length = 2
}

resource "google_compute_network" "toggl_network" {
  project                 = var.project_id
  name                    = "toggl-network-${random_id.random.dec}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "toggl_subnet" {
  name          = "toggl-subnet-${random_id.random.dec}"
  ip_cidr_range = var.vpc_cidr
  region        = var.region
  network       = google_compute_network.toggl_network.id
}

# Firewall Rules
resource "google_compute_firewall" "private_access" {
  name          = "toggl-private-${random_id.random.dec}"
  network       = google_compute_network.toggl_network.id
  source_ranges = [var.vpc_cidr]
  description   = "Creates Firewall Rule for Private Access between Nodes"

  allow {
    protocol = "tcp"
    ports    = ["22", "5432"]
  }
}

resource "google_compute_firewall" "public_access" {
  name          = "toggl-public-${random_id.random.dec}"
  network       = google_compute_network.toggl_network.id
  source_ranges = [var.access_ip]
  description   = "Creates Firewall Rule for Public Access through Port 22"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}