/**
 * stacks/aws/main.tf
 *
 * This directory is a Terraform ROOT MODULE for AWS.
 * In Terraform terms: the root module is simply "the directory you run terraform from".
 *
 * ADR-009 pattern:
 * - Root module stays thin.
 * - Root module orchestrates capability modules under ./capabilities/.
 * - Capability modules own the contract schema + validation + mapping to implementations.
 */

module "compute" {
  # "enabled" is part of the promoted shape. If disabled, the capability is a no-op.
  count  = try(var.compute.enabled, false) ? 1 : 0

  # Local capability module (composition boundary)
  source = "./capabilities/compute"

  # Contract values flow DOWN from root -> capability module
  compute = var.compute
}
