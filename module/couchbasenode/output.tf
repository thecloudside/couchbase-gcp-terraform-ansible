output "couchbase-node-1-ip" {
  value = google_compute_instance.vm2.network_interface.0.network_ip
}

output "couchbase-node-2-ip" {
  value = google_compute_instance.vm3.network_interface.0.network_ip
}
