resource "google_compute_firewall" "rules" {
  project     = var.project-id
  name        = var.firewall-rule-name
  network     = var.network
  description = "Creates firewall rule for connecting couhbasenode"

  allow {
    protocol  = "tcp"
    ports     = ["8091", "21100", "4369"]
  }

  source_ranges = var.source-range
  target_tags = var.tags
}
