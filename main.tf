provider "google" { 
    project = "project-1-334518"
    region = "us-central1"
    credentials = "credentials.json"
  
}

module "couchbasenode" {
    source = "./module/couchbasenode"
  }

resource "local_file" "inventory-file" {
    content = "#!/bin/bash \nnodeone=http://${module.couchbasenode.couchbase-node-1-ip}:8091 \nnodetwo=http://${module.couchbasenode.couchbase-node-2-ip}:8091"
    filename = "/root/couchbase-add-node.j2"
    file_permission = "0664"
    depends_on = [
      module.couchbasenode
    ]
} 

module "couchbasemain" {
    source = "./module/couchbasemain"
    depends_on = [
      local_file.inventory-file
    ]
    
}
