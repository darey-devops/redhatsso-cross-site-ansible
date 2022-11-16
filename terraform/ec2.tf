# TODO: userdata to update /etc/hosts
# install ansible - sudo dnf install -y ansible-core git, dev tools
terraform {
  required_version = ">= 1.3.2"

  backend "s3" {
    bucket = "redhat-sso"
    key    = "state/sso-poc.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "sso"
}

# US_EAST-1
# resource "aws_instance" "sso" {
#   count                  = 12
#   ami                    = "ami-07077ce2bb7ac551e"
#   instance_type          = "m4.large"
#   key_name               = aws_key_pair.sso_key.key_name
#   vpc_security_group_ids = ["sg-0335d483afc866cf1"]
#   tags = {
#     Name = "terraform-managed-redhat-sso-${count.index}"
#   }
# }

resource "aws_instance" "control" {
  count                  = 1
  ami                    = "ami-023cd3f0d10fb8a9c"
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-redhat-ansible-control-${count.index + 1}"
  }
}

resource "aws_instance" "rhssoa" {
  count                  = 2
  ami                    = "ami-023cd3f0d10fb8a9c"
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhssoa-${count.index + 1}"
  }
}

resource "aws_instance" "rhssob" {
  count                  = 2
  ami                    = "ami-023cd3f0d10fb8a9c"
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhssob-${count.index + 1}"
  }
}

resource "aws_instance" "rhdga" {
  count                  = 2
  ami                    = "ami-023cd3f0d10fb8a9c"
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhdga-${count.index + 1}"
  }
}

resource "aws_instance" "rhhaproxy" {
  count                  = 1
  ami                    = "ami-023cd3f0d10fb8a9c"
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhhaproxy-${count.index + 1}"
  }
}

resource "aws_key_pair" "sso_key" {
  key_name   = "poc-sso-key"
  public_key = var.ssh_key
}