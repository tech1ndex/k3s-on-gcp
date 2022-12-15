provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = "${var.gcp_region}-b"
}

resource "google_compute_instance" "k3s_master_instance" {
  name = "k3s-master"
  machine_type = "e2-micro"
  can_ip_forward = "true"
  allow_stopping_for_update = "true"
  tags         = ["k3s", "k3s-master", "http-server", "https-server","ssh", "http-server", "https-server"]
  zone = "${var.gcp_region}-b"

  boot_disk {
    initialize_params {
      type  = "pd-standard" 
      image = "ubuntu-1804-bionic-v20221201"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }


  provisioner "remote-exec" {
  connection {
     host        = "${self.network_interface[0].access_config[0].nat_ip}"
     type        = "ssh"
     user        = var.gcp_user 
     timeout     = "300s"
     # private_key being used to connect to the VM. ( the public key was copied earlier using metadata )
     private_key = file(var.privatekeypath)
   }

    inline = ["echo connected to server, starting k3s install"]
  }
  

  provisioner "local-exec" {
    command = <<EOT
            k3sup install \
            --ip ${self.network_interface[0].access_config[0].nat_ip} \
            --ssh-key ~/.ssh/google_compute_engine \
            --user $(whoami) \
            --sudo \
            --k3s-extra-args '--disable traefik'
        EOT
  }

  depends_on = [
    google_compute_firewall.k3s-firewall,
  ]
}

