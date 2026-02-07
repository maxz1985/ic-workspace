provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  # Auth is via environment / ADC / TFE workspace creds
}
