variable "name"         { type = string }
variable "machine_type" { type = string }
variable "zone"         { type = string }
variable "subnetwork"   { type = string }
variable "boot_disk_gb" { type = number }
variable "source_image" { type = string }
variable "network_tags" { type = list(string), default = [] }
variable "service_account_email" { type = string, default = null }
variable "labels"       { type = map(string) }
