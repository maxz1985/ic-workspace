/**
 * Compute capability contract
 *
 * This variable defines the intent-level interface for creating
 * a single compute instance (VM) across clouds.
 *
 * The shape of this contract is IDENTICAL in AWS, GCP, and Azure.
 * Cloud-specific differences are handled inside the capability
 * implementation, not by changing the contract.
 */
variable "compute" {
  type = object({

    /**
     * Feature toggle.
     * Allows enabling/disabling the capability without deleting config.
     */
    enabled = bool

    /**
     * Logical name of the instance.
     * Mapped to Name tag / resource name per cloud.
     */
    name = string

    /**
     * Common metadata / tags / labels.
     * Enforced via policy and propagated to cloud-native tagging mechanisms.
     */
    metadata = map(string)

    /**
     * Instance size / shape.
     * Cloud-specific value (e.g. t3.medium, e2-standard-2, Standard_D2s_v5).
     *
     * The contract standardizes the FIELD NAME, not the value set.
     */
    size = string

    /**
     * Root disk size in GB.
     * Interpreted per cloud as OS disk size.
     */
    disk_gb = number

    /**
    * Placement-related intent.
    *
    * subnet_ref is always required.
    *
    * zone is optional:
    * - Required by some clouds (e.g. GCP)
    * - Implicit via subnet in others (e.g. AWS)
    * - Optional / opt-in in some (e.g. Azure)
    */
    placement = object({
      subnet_ref = string
      zone       = optional(string)
    })

    /**
     * AWS-specific escape hatch.
     * These values are passed directly to the AWS implementation module.
     *
     * Escape hatches are allowed ONLY for identifiers that cannot be
     * meaningfully abstracted without platform-wide lookup logic.
     */
    aws = optional(object({
      ami_id               = string
      security_group_ids   = list(string)
      iam_instance_profile = optional(string)
    }))

    /**
     * GCP-specific escape hatch.
     */
    gcp = optional(object({
      source_image          = string
      network_tags          = optional(list(string))
      service_account_email = optional(string)
    }))

    /**
     * Azure-specific escape hatch.
     */
    azure = optional(object({
      source_image_id          = string
      resource_group_name      = string
      location                 = string
      ssh_public_key_path      = string
      admin_username           = optional(string)
      system_assigned_identity = optional(bool)
    }))
  })

  /**
   * Basic sanity validation.
   * Ensures the contract is not partially specified when enabled.
   */
  validation {
    condition = (
      var.compute.enabled == false
      ||
      (
        length(var.compute.name) > 0 &&
        length(var.compute.size) > 0 &&
        var.compute.disk_gb > 0
      )
    )
    error_message = "When compute.enabled is true, name, size, and disk_gb must be set."
  }
}
