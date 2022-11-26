# TODO: userdata to update /etc/hosts
# install ansible - sudo dnf install -y ansible-core git, dev tools
terraform {
  required_version = ">= 1.3.2"

  backend "s3" {}
}

provider "aws" {
  region  = "eu-west-2"
  profile = "iamgp"
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
  ami                    = var.ami
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-redhat-ansible-control-${count.index + 1}"
  }
  provisioner "file" {
    source      = "/home/iamgp/Desktop/dev/devprojects/redhatsso-cross-site-ansible/terraform/source/hosts"
    destination = "/home/ec2-user/host"
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("/home/iamgp/.ssh/id_aws") 
      
      # timeout     = "4m"
   }
   provisioner "remote-exec" {
    inline = [
      "sudo /bin/bash -c 'cat ./host >> /etc/hosts'"
    ]
}
}

resource "aws_instance" "rhssoa" {
  count                  = 2
  ami                    = var.ami
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhssoa-${count.index + 1}"
  }
}

resource "aws_instance" "rhssob" {
  count                  = 2
  ami                    = var.ami
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhssob-${count.index + 1}"
  }
}

resource "aws_instance" "rhdga" {
  count                  = 2
  ami                    = var.ami
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhdga-${count.index + 1}"
  }
}


resource "aws_instance" "rhdgb" {
  count                  = 2
  ami                    = var.ami
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhdgb-${count.index + 1}"
  }
}

resource "aws_instance" "rhhaproxy" {
  count                  = 1
  ami                    = var.ami
  instance_type          = "m4.large"
  key_name               = aws_key_pair.sso_key.key_name
  vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
  tags = {
    Name = "${var.developer}-rhhaproxy-${count.index + 1}"
  }
}

resource "aws_key_pair" "sso_key" {

  key_name   = "${var.developer}-poc-sso-key"
  public_key = var.ssh_key
}


# resource "aws_instance" "test" {
#   count                  = 1
#   ami                    = var.ami
#   instance_type          = "m4.large"
#   key_name               = aws_key_pair.sso_key.key_name
#   vpc_security_group_ids = ["sg-0861a249f79fe7ddc"]
#   tags = {
#     Name = "${var.developer}-rhhaproxy-${count.index + 1}"
#   }

#####  Upload host file into ec2

  # provisioner "file" {
  #       source      = "./terraform/source/hosts"
  #       destination = "/var/tmp/ "
  #       # source      = "./Terraform/redhatsso-cross-site-ansible/terraform/source/hosts"
       
  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = "${file("~/.ssh/ansible.pem")}"   # substitute your path in this location
  #     host        = "${self.public_ip}"
  #   }
  #  }


  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo cp -R /var/tmp/hosts ~/home/ec2",
  #     "ls",
  #   ]
  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = "${file("~/.ssh/id_rsa")}"
  #     host        = "${self.public_ip}"
  #   }  
  
  # }


# update the host files by uploading the files to etc/hosts 