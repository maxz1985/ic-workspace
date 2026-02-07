module "compute_instance" {
  # In production: app.terraform.io/<ORG>/compute-instance/azurerm
  source = "../../../modules/azure/compute-instance"

  name                = var.compute.name
  vm_size             = var.compute.size
  subnet_id           = var.compute.placement.subnet_ref
  os_disk_size_gb     = var.compute.disk_gb

  source_image_id     = var.compute.azure.source_image_id
  location            = var.compute.azure.location
  resource_group_name = var.compute.azure.resource_group_name

  system_assigned_identity = try(var.compute.azure.system_assigned_identity, true)

  # NEW (runnable)
  admin_username      = try(var.compute.azure.admin_username, null)
  ssh_public_key_path = var.compute.azure.ssh_public_key_path

  tags = var.compute.metadata
}
