output "compute_id" {
  value = try(module.compute[0].id, null)
}

output "compute_private_ip" {
  value = try(module.compute[0].private_ip, null)
}
