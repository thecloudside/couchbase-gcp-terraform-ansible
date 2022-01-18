provider "google" { 
    project = var.project-id
    region = var.region
    zone   = var.zone
  
}

module "couchbasenode" {
    source                  = "./module/couchbasenode"
    vm-2-name               = var.vm-2-name
    vm-3-name               = var.vm-3-name
    machine_type            = var.machine_type
    image                   = var.image
    network                 = var.network
    subnetwork              = var.subnetwork
    ssh-username            = var.ssh-username                       #as per your ssh public key
    private-key-path        = var.private-key-path                  # make sure it is accessible
    playbook-path           = var.playbook-path
    tags                    = var.tags
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
    vm-1-name               = var.vm-1-name
    machine_type            = var.machine_type
    image                   = var.image
    network                 = var.network
    subnetwork              = var.subnetwork
    ssh-username            = var.ssh-username
    private-key-path        = var.private-key-path
    playbook-path           = var.playbook-path
    tags                    = var.tags
    depends_on = [
      local_file.add-node-script-file
    ]
    
}
