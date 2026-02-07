resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  labels = var.labels
  tags   = var.network_tags

  boot_disk {
    initialize_params {
      image = var.source_image
      size  = var.boot_disk_gb
    }
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  dynamic "service_account" {
    for_each = var.service_account_email == null ? [] : [1]
    content {
      email  = var.service_account_email
      scopes = ["cloud-platform"]
    }
  }
}
