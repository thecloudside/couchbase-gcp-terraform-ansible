variable "vm-2-name" {
  type = string
}

variable "vm-3-name" {
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

