/**
 * stacks/aws/capabilities/compute/outputs.tf
 *
 * Capability outputs are normalized here:
 * - id
 * - private_ip
 *
 * Root module re-exports these as platform outputs.
 */

output "id" {
  value       = module.compute_instance.id
  description = "Compute instance ID."
}

output "private_ip" {
  value       = module.compute_instance.private_ip
  description = "Compute instance private IP."
}
