provider "google" { 
    project = var.project-id
    region = var.region
    zone   = var.zone
  
}

module "couchbasenode" {
    source                  = "./module/couchbasenode"
    vm-2-name               = "couchbase-vm-02"
    vm-3-name               = "couchbase-vm-03"
    machine_type            = "e2-medium"
    image                   = "ubuntu-minimal-1804-lts"
    network                 = "default"
    subnetwork              = "default"
    ssh-username            = "devuser"                           #as per your ssh public key
    private-key-path        = "/tmp/test-key"                   # make sure it is accessible
    playbook-path           = "/root"
    tags                    = ["couchbase"]
  }

resource "local_file" "add-node-script-file" {
    content = "#!/bin/bash \nnodeone=http://${module.couchbasenode.couchbase-node-1-ip}:8091 \nnodetwo=http://${module.couchbasenode.couchbase-node-2-ip}:8091"
    filename = "${var.add-node-script-file}/couchbase-add-node.j2"
    file_permission = "0664"
    depends_on = [
      module.couchbasenode
    ]
} 

module "couchbasemain" {
    source                  = "./module/couchbasemain"
    vm-1-name               = "couchbase-vm-01"
    machine_type            = "e2-medium"
    image                   = "ubuntu-minimal-1804-lts"
    network                 = "default"
    subnetwork              = "default"
    ssh-username            = "devuser"
    private-key-path        = "/tmp/test-key"
    playbook-path           = "/root"
    tags                    = ["couchbase"]
    depends_on = [
      local_file.add-node-script-file
    ]
    
}
