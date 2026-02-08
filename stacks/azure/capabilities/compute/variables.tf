variable "compute" {
  description = "Compute capability contract (intent-level interface)."

  type = object({
    enabled  = bool
    name     = string
    metadata = map(string)

    size    = string
    disk_gb = number

    placement = object({
      subnet_ref = string
      zone       = optional(string) # not used in this Azure example
    })

    azure = optional(object({
      source_image_id          = string
      location                 = string
      resource_group_name      = string
      system_assigned_identity = optional(bool)

      # Runnable demo: how we provide SSH access without committing keys to Git
      ssh_public_key_path = string
      admin_username      = optional(string) # defaults to "azureuser" in module
    }))

  })

  validation {
    condition     = var.compute.disk_gb >= 20
    error_message = "compute.disk_gb must be >= 20."
  }
}
