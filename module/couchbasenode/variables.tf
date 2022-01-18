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
  default = "default"
}

variable "subnetwork" {
  type = string
  default = "default"
}

variable "tags" {
  type    = list(string)
  default = ["couchbase"]
}


variable "ssh-username" {
  type = string
  default = "devuser"
}

variable "private-key-path" {
  type = string
  default = "/tmp/test-key"  #make sure file is accessible
}

variable "playbook-path" {
  type = string
  default = "/root"  #make sure file is accessible
}

