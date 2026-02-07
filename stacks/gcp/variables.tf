variable "compute" {
  description = "Compute capability input. Validated inside ./capabilities/compute."
  type        = any
}

variable "gcp_project" {
  description = "GCP project id."
  type        = string
}

variable "gcp_region" {
  description = "GCP region (e.g., us-central1)."
  type        = string
  default     = "us-central1"
}
