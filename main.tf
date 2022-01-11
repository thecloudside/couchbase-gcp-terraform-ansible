provider "google" { 
    project = var.project-id
    region = var.region
  
}

module "couchbasenode" {
    source                  = "./module/couchbasenode"
    vm-1-name               = "couchbase-node-1"
    vm-2-name               = "couchbase-node-2"
    machine_type            = "e2-medium"
    zone                    = "us-west4-b"
    image                   = "ubuntu-minimal-1804-lts"
    network                 = "default"
    ssh-username            = "sabir"                           #as per your ssh public key
    private-key-path        = "/tmp/test"                   # make sure it is accessible
    playbook-absolute-path  = "/root"
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
    vm-name                 = "couchbase-main"
    machine_type            = "e2-medium"
    zone                    = "us-west4-b"
    image                   = "ubuntu-minimal-1804-lts"
    network                 = "default"
    ssh-username            = "sabir"
    private-key-path        = "/tmp/test"
    playbook-absolute-path  = "/root"
    depends_on = [
      local_file.add-node-script-file
    ]
    
}
