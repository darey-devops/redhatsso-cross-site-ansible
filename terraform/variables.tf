variable "developer" {
  type = string
  default = "dare"
}

variable "ssh_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCz0bL5lf39ZUKVPlKy6dYw+1r8EAEBKzd13HX3Ab3Y4ZFS8g5MgpyPa1gcol5uxW8uRkuRJT3GlpIRyIU1XYRwsabeaRBuaHpnlon913SestYHlclJ+gVZZzw4veGkNWF0/suGDtsTEQql2AP/4sIGYnkAdpZ/Kb5ndNVPVQzW8FZW14AYyf9UA3TQtrIsH6JYIs9OtqwQubh+pRJEMfk9KmYJJtXzjSsOubSKD3791SMVhn3EoqTdTzHUVNr2wY0rMwb4VLLvz0CoCIsNHcOsdHq69XHTJD6RcrvzfI6Q4UUUbJO+y+pnyIHt0V1LwV52W2R0HJeIBMZtt9DqIWbco0nreLmp+SG75wSQTl57+8mXXRw8epgMI/fwVKmz7Es1n8pITpVpvfLKqdSv51S86Iy2oDzDcRUJtms88QD9ZrmWRG9l7Ilje7pRtK3eK/C5dq0mb0nSCMT9WcfMSVMjaTtJG6O202I4z1snEHbozKbQwgjAWD5tjlrDGdZNZVM="
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


