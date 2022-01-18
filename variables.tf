variable "project-id" {
  type = string
  description = "The project ID to host the cluster in (required)"
}

variable "region" {
  type = string
  description = "The region to host the VM"
}

variable "zone" {
  type = string
  description = "The zones to host VM"
}

variable "add-node-script-file" {
  type = string
  description = "Script file path to save the details of node"
}

variable "vm-1-name" {
  type = string
  default = "couchbase-vm-01"
}

variable "vm-2-name" {
  type = string
  default = "couchabase-vm-02"
}

variable "vm-3-name" {
  type = string
  default = "couchabase-vm-03"
}


variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "image" {
  type = string
  default = "ubuntu-minimal-1804-lts"
}

variable "network" {
  type = string
  description = "VPC Name"
}

variable "subnetwork" {
  type = string
  description = "Subnet Name"
}

variable "tags" {
  type    = list(string)
  description = "Network tags"
  default = ["couchbase"]
}


variable "ssh-username" {
  type = string
  description = "SSH key username, which is given in public key"
}

variable "private-key-path" {
  type = string
  description = "SSH Private key path" 
}

variable "playbook-path" {
  type = string
  description = "Playbook path, Where you clone the code"
}

