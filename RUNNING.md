# RUNNING.md

This document explains how to **validate, plan, and apply** the example stacks in this repo.

This repo is primarily a **reference implementation** for the ADR-009 / ADR-010 patterns.
You do **not** need to apply anything to understand the structure.
However, each stack *can* be made runnable with minimal setup.

## What this repo demonstrates (recap)

- Each directory under `stacks/` is a **Terraform root module**
- Each root maps to a **separate Terraform Enterprise workspace** (or local Terraform run)
- Capability modules live under `capabilities/`
- Capability modules:
  - define the **contract**
  - validate inputs
  - map intent → cloud-native implementation modules
- Implementation modules are modeled locally under `modules/` for demo purposes

## Terraform version

This repo expects:

- Terraform >= 1.6
- Providers:
  - AWS: `hashicorp/aws`
  - GCP: `hashicorp/google`
  - Azure: `hashicorp/azurerm`

## Quick sanity check (no credentials required)

You can validate Terraform syntax without any cloud credentials.

From repo root:

```bash
cd stacks/aws
terraform init
terraform validate

cd ../gcp
terraform init
terraform validate

cd ../azure
terraform init
terraform validate
```

If validation passes, the repo structure and module wiring are correct.

## Running a stack (general rules)

Each stack (`stacks/aws`, `stacks/gcp`, `stacks/azure`) is run **independently**.

General workflow:

```bash
cd stacks/<cloud>
terraform init
terraform plan
terraform apply
```

Before running `plan` or `apply`, you must:

1. Configure provider authentication
2. Replace placeholder values in `env.auto.tfvars`
3. Ensure referenced infrastructure (subnets, images, etc.) exists

## AWS stack

### Required before plan/apply

1. AWS credentials available via one of:

   * environment variables
   * AWS CLI / SSO
   * assumed role
   * Terraform Enterprise workspace credentials

2. Edit `stacks/aws/env.auto.tfvars`:

   * `subnet_ref`
   * `security_group_ids`
   * `ami_id`

These must exist in your AWS account.

### Run

```bash
cd stacks/aws
terraform init
terraform plan
terraform apply
```

## GCP stack

### Required before plan/apply

1. GCP authentication via:

   * Application Default Credentials (`gcloud auth application-default login`)
   * or Terraform Enterprise workspace identity

2. Set required variables:

   * `gcp_project` (via `-var`, tfvars, or environment)

3. Edit `stacks/gcp/env.auto.tfvars`:

   * `subnet_ref`
   * `zone`
   * `source_image`

### Example

```bash
cd stacks/gcp
export TF_VAR_gcp_project=my-project-id
terraform init
terraform plan
terraform apply
```

## Azure stack (fully runnable)

The Azure stack is designed to be **fully runnable without committing secrets**.

### Required before plan/apply

1. Authenticate to Azure using one of:

   * `az login`
   * Managed Identity
   * Terraform Enterprise workspace identity
   * ARM_* environment variables

2. Edit `stacks/azure/env.auto.tfvars`:

   * `subnet_ref`
   * `source_image_id`
   * `resource_group_name`
   * `location`
   * `ssh_public_key_path` (path to a local `.pub` file)

Example SSH key path:

```hcl
ssh_public_key_path = "~/.ssh/id_ed25519.pub"
```

The key file must exist on the machine running Terraform.

### Run

```bash
cd stacks/azure
terraform init
terraform plan
terraform apply
```

## Notes on state and cleanup

* Each stack has its **own Terraform state**
* Destroy is also per cloud:

```bash
terraform destroy
```

* Nothing in this repo attempts to coordinate changes across clouds

This is intentional.

## Important warnings

* This repo uses **real cloud resources** if you run `apply`
* Costs may be incurred
* Always review `terraform plan` output carefully
* Do not use production credentials unless you understand the impact

## If something fails

Common causes:

* Placeholder IDs not replaced
* Missing permissions
* Incorrect region / zone
* Provider authentication not configured

The intent of this repo is clarity, not bulletproof automation.

## Final reminder

This repo is a **reference example**:

* to show how contracts, capabilities, and stacks fit together
* to make ADR-009 / ADR-010 concrete
* to provide a copyable pattern for future workspaces

It is intentionally explicit, commented, and slightly verbose.


## Next

- add a diagram to the README showing root → capability → module flow
- add a second capability (e.g. `object_storage`) in a minimal form to show scaling the pattern

