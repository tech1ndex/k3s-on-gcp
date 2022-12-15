resource "google_compute_firewall" "k3s-firewall" {
  name    = "k3s-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["6443"]
  }

  target_tags = ["k3s"]
  source_ranges = [var.publicip]
  
}