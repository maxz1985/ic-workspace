/**
 * stacks/aws/capabilities/compute/variables.tf
 *
 * This is the CONTRACT definition for the compute capability.
 * This schema + validation is authoritative for "compute" in the AWS stack.
 *
 * In the platform, we keep this contract shape consistent across aws/gcp/azure,
 * even if some fields are optional or unused in certain clouds.
 */

variable "compute" {
  description = "Compute capability contract (intent-level interface)."

  type = object({
    enabled  = bool
    name     = string
    metadata = map(string)

    # env-owned tuning
    size    = string
    disk_gb = number

    placement = object({
      subnet_ref = string
      zone       = optional(string) # not used in AWS example, but kept for parity
    })

    # cloud-specific escape hatch identifiers
    aws = optional(object({
      ami_id               = string
      security_group_ids   = list(string)
      iam_instance_profile = optional(string)
    }))
  })

  validation {
    condition     = var.compute.disk_gb >= 20
    error_message = "compute.disk_gb must be >= 20."
  }
}
