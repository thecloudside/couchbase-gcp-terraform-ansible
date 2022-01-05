resource "google_compute_instance" "vm1" {
    name = "couchbase-main"
    machine_type = "e2-medium"
    zone = "us-west4-b"
    tags = ["name", "main-node"]
 boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  connection {
    type = "ssh"
    user = "sabir"
    private_key = file("/tmp/test")
    host = google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip
  }

 provisioner "remote-exec" {
    inline = ["echo wait until ssh ready"]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip}, /root/ws-couchbase/couchbase-cluster-setup.yml"  
  }
}
