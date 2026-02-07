variable "compute" {
  description = "Compute capability input. Validated inside ./capabilities/compute."
  type        = any
}

variable "azure_location" {
  description = "Azure location for resources (e.g., eastus)."
  type        = string
  default     = "eastus"
}
