/**
 * stacks/aws/outputs.tf
 *
 * Root outputs are "normalized" capability outputs.
 * Keep these minimal: only what downstream users/systems commonly need.
 */

output "compute_id" {
  value       = try(module.compute[0].id, null)
  description = "Normalized compute identifier."
}

output "compute_private_ip" {
  value       = try(module.compute[0].private_ip, null)
  description = "Normalized compute private IP."
}
