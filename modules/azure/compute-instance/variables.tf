variable "name"                { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }
variable "vm_size"             { type = string }
variable "subnet_id"           { type = string }
variable "source_image_id"     { type = string }
variable "os_disk_size_gb"     { type = number }
variable "system_assigned_identity"{ 
  type = bool
  default = true 
}
variable "tags"                { type = map(string) }
variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for the VM."
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key file on the machine running Terraform."
}

