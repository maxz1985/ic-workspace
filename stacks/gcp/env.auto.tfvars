compute = {
  size    = "e2-micro"
  disk_gb = 20

  placement = {
    # Use a real subnetwork self_link or name as required by your org conventions.
    subnet_ref = "projects/<PROJECT>/regions/us-central1/subnetworks/<SUBNET>"
    zone       = "us-central1-a"
  }

  gcp = {
    source_image          = "projects/debian-cloud/global/images/family/debian-12"
    # network_tags        = ["web"]
    # service_account_email = "svc-demo@<PROJECT>.iam.gserviceaccount.com"
  }
}
