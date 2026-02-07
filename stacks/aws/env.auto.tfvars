/**
 * stacks/aws/env.auto.tfvars
 *
 * ENV-OWNED file: scaling/tuning/placement and cloud-specific identifiers.
 * This is NOT promoted. It differs between dev/sat/prod (and differs per cloud).
 */

compute = {
  # Cloud-native instance type (AWS value here)
  size    = "t3.micro"
  disk_gb = 20

  placement = {
    # For a runnable demo, you must supply real AWS IDs in YOUR account.
    subnet_ref = "subnet-xxxxxxxx"
  }

  aws = {
    ami_id             = "ami-xxxxxxxx"
    security_group_ids = ["sg-xxxxxxxx"]
    # optional:
    # iam_instance_profile = "my-instance-profile"
  }
}
