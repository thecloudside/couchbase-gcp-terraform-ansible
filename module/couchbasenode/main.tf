resource "google_compute_instance" "vm2" {
  name         = var.vm-2-name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral public IP
    }
  }
  
connection {
   type = "ssh"
   user = var.ssh-username
   private_key = file("${var.private-key-path}")
   host = google_compute_instance.vm2.network_interface.0.access_config.0.nat_ip
}

 provisioner "remote-exec" {
    inline = ["echo wait until ssh ready"]
  }


provisioner "local-exec" {
         command = "ansible-playbook -i ${google_compute_instance.vm2.network_interface.0.access_config.0.nat_ip}, ${var.playbook-path}/ws-couchbase/couchbase-node-setup.yml"
}
}
resource "google_compute_instance" "vm3" {
  name         = var.vm-3-name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral public IP
    }
  }
  
connection {
   type = "ssh"
   user = var.ssh-username
   private_key = file("${var.private-key-path}")
   host = google_compute_instance.vm3.network_interface.0.access_config.0.nat_ip
}

provisioner "remote-exec" {
   inline =  ["echo wait until ssh ready"]
}

provisioner "local-exec" {
         command = "ansible-playbook -i ${google_compute_instance.vm3.network_interface.0.access_config.0.nat_ip}, ${var.playbook-path}/ws-couchbase/couchbase-node-setup.yml"
}
}

