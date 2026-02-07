# ic-workspace

Reference workspace repo showing the ADR-009 pattern using a simple capability: **compute** (a VM) across AWS, GCP, and Azure.

## What this repo is demonstrating

- Each directory under `stacks/` is a **Terraform root module** (independent execution + state).
- Root modules stay thin.
- Capability modules under `capabilities/` own:
  - the **contract** (schema + validation)
  - the **wiring** to an implementation module
  - **normalized outputs**
- Implementation modules (normally published to TFE PMR) are modeled here as local modules under `modules/` so the repo is self-contained.

## Repo layout

- `stacks/aws`   - AWS Terraform root module
- `stacks/gcp`   - GCP Terraform root module
- `stacks/azure` - Azure Terraform root module
- `modules/...`  - local stand-in modules for cloud-specific implementations

## Promote vs env tfvars

Each cloud stack has:
- `promote.auto.tfvars` (promoted): enablement + metadata
- `env.auto.tfvars` (env-owned): sizing + placement + cloud-specific IDs

## Running this repo

This repo is primarily for reading and understanding the pattern.

To validate syntax (no credentials required):
- `cd stacks/aws && terraform init && terraform validate`
- `cd stacks/gcp && terraform init && terraform validate`
- `cd stacks/azure && terraform init && terraform validate`

To actually plan/apply you must:
- configure provider authentication for that cloud
- replace placeholder IDs in env.auto.tfvars (subnets, images, security groups, etc.)
