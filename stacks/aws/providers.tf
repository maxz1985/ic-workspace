/**
 * stacks/aws/providers.tf
 *
 * Provider config for the AWS root module.
 * Authentication is intentionally NOT hard-coded here.
 *
 * Typical auth options:
 * - env vars: AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_SESSION_TOKEN
 * - AWS SSO
 * - Terraform Enterprise workspace credentials
 * - assumed roles, etc.
 *
 * This repo is an example, so we keep it generic.
 */

provider "aws" {
  region = var.aws_region
}
