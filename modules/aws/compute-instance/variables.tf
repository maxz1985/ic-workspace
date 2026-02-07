variable "name"                { type = string }
variable "instance_type"        { type = string }
variable "ami_id"              { type = string }
variable "subnet_id"           { type = string }
variable "security_group_ids"  { type = list(string) }
variable "root_volume_size_gb" { type = number }
variable "iam_instance_profile" { type = string, default = null }
variable "tags"                { type = map(string) }
