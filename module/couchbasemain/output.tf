output "couchbase-main-node-ip" {
  value = google_compute_instance.vm1.network_interface.0.network_ip
}
