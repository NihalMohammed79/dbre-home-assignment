terraform {
  cloud {
    organization = "toggl"

    workspaces {
      name = "dbre-home-assignment"
    }
  }
}