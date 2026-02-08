module "compute" {
  count  = try(var.compute.enabled, false) ? 1 : 0
  source = "./capabilities/compute"
  compute = var.compute
}
