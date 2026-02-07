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
      zone       = optional(string)
    })

    gcp = optional(object({
      source_image          = string
      network_tags          = optional(list(string))
      service_account_email = optional(string)
    }))
  })

  validation {
    condition     = var.compute.disk_gb >= 20
    error_message = "compute.disk_gb must be >= 20."
  }
}
