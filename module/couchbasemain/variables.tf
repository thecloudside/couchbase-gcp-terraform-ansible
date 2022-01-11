variable "vm-name" {
  type = string
  default = "couchabase-main"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "zone" {
  type = string
  default = "us-west4-b"
}

variable "image" {
  type = string
  default = "ubuntu-minimal-1804-lts"
}

variable "network" {
  type = string
  default = "default"
}

variable "ssh-username" {
  type = string
  default = "sabir"
}

variable "private-key-path" {
  type = string
  default = "/tmp/test"  #make sure file is accessible
}

variable "playbook-absolute-path" {
  type = string
  default = "/root"  #make sure file is accessible
}

