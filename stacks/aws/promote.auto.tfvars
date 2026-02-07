/**
 * stacks/aws/promote.auto.tfvars
 *
 * PROMOTED file: "shape/feature enablement" and stable metadata.
 * Rule of thumb:
 * - if changing it changes WHAT exists, it belongs here
 * - if changing it changes HOW BIG or WHERE, it belongs in env.auto.tfvars
 */

compute = {
  enabled = true
  name    = "demo-aws-vm-01"

  # Enforced by policy in the real platform (required keys, allowed values, etc.)
  metadata = {
    app         = "ic-workspace"
    env         = "dev"
    owner       = "platform-team"
    cost_center = "cc-1234"
  }
}
