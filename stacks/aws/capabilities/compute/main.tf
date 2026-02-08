/**
 * stacks/aws/capabilities/compute/main.tf
 *
 * Capability wiring:
 * - maps the contract to an implementation module.
 *
 * In production, the implementation module would be sourced from TFE Private Module Registry:
 *   source = "app.terraform.io/<ORG>/compute-instance/aws"
 *
 * In this demo repo, we use a LOCAL module so the example is self-contained.
 */

module "compute_instance" {
  source = "../../../../modules/aws/compute-instance"

  name                = var.compute.name
  instance_type       = var.compute.size
  ami_id              = var.compute.aws.ami_id
  subnet_id           = var.compute.placement.subnet_ref
  security_group_ids  = var.compute.aws.security_group_ids
  root_volume_size_gb = var.compute.disk_gb

  iam_instance_profile = try(var.compute.aws.iam_instance_profile, null)

  tags = var.compute.metadata
}
