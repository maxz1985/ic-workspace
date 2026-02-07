/**
 * stacks/aws/variables.tf
 *
 * Root module inputs:
 * - Keep root variables intentionally thin.
 * - We set `type = any` so the root does not re-declare the full contract schema.
 * - The capability module performs the schema validation (variables.tf under capabilities/compute).
 *
 * Why:
 * - Avoid contract bloat in the root as capabilities grow.
 * - Keep the unit of extension localized under capabilities/<capability>.
 */

variable "compute" {
  description = "Compute capability input. Validated inside ./capabilities/compute."
  type        = any
}

/**
 * Provider configuration inputs.
 * For demo purposes these are minimal and can be satisfied via environment variables too.
 */
variable "aws_region" {
  description = "AWS region for the AWS provider (e.g., us-east-1)."
  type        = string
  default     = "us-east-1"
}
