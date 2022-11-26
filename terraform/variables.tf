variable "developer" {
  type = string
  default = "godspower"
}

variable "ssh_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIClgmDWw19m+yIQVq4jjJ+PW5yoOIqbA9AunV07mlt75 aws - iamgpower3@gmail.com"
}

variable "ami" {
  type = string
  default = "ami-023cd3f0d10fb8a9c"
}

variable "sg" {
  type = string
  default = "ami-023cd3f0d10fb8a9c"
}

# variable "destination" {
#   type = string
#   default = "/home/hosts"
# }

# variable "source_path" {
#   type = string
#   default = "source/hosts"
# }

# variable "ssh_key_path" {
#   type = string
#   default = "~/.ssh/id_rsa"
# }

