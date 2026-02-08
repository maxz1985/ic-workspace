module "compute_instance" {
  # In production: app.terraform.io/<ORG>/compute-instance/google
  source = "../../../../modules/gcp/compute-instance"

  name         = var.compute.name
  machine_type = var.compute.size
  zone         = var.compute.placement.zone
  subnetwork   = var.compute.placement.subnet_ref
  boot_disk_gb = var.compute.disk_gb

  source_image          = var.compute.gcp.source_image
  network_tags          = try(var.compute.gcp.network_tags, [])
  service_account_email = try(var.compute.gcp.service_account_email, null)

  labels = var.compute.metadata
}
