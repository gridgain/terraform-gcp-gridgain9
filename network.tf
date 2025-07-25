locals {
  create_vpc = var.vpc_id == ""
  vpc_id     = local.create_vpc ? google_compute_network.vpc[0].id : var.vpc_id
  subnet     = local.create_vpc ? google_compute_subnetwork.subnet[0].name : var.subnet_id
  zone_count = length(var.zones)
}

resource "google_compute_network" "vpc" {
  count       = local.create_vpc ? 1 : 0
  name        = "${var.name_prefix}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  count          = local.create_vpc ? 1 : 0
  name           = "${var.name_prefix}-subnet"
  ip_cidr_range  = var.subnet_cidr
  region         = var.region
  network        = google_compute_network.vpc[0].id
  private_ip_google_access = true
}
