variable "vm-1-name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "image" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "tags" {
  type    = list(string)
}

variable "ssh-username" {
  type = string
}

variable "private-key-path" {
  type = string
}

variable "playbook-path" {
  type = string
}

