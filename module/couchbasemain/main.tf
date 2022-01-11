resource "google_compute_instance" "vm1" {
    name = var.vm-name
    machine_type = var.machine_type
    zone = var.zone
    tags = ["name", "main-node"]
 boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network

    access_config {
      // Ephemeral public IP
    }
  }

  connection {
    type = "ssh"
    user = var.ssh-username
    private_key = file("${var.private-key-path}")
    host = google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip
  }

 provisioner "remote-exec" {
    inline = ["echo wait until ssh ready"]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip}, ${var.playbook-absolute-path}/couchbase-gcp-terraform-ansible/couchbase-cluster-setup.yml"  
  }
}
