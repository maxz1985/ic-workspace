output "id" {
  value = google_compute_instance.this.id
}

output "private_ip" {
  value = google_compute_instance.this.network_interface[0].network_ip
}
