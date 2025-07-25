
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

locals {
  name = "myserver"
}

resource "aws_instance" "myserver" {
  ami = "ami-0b4fbd58a32e7ef15" 
  instance_type = var.aws_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }

  tags = merge(var.additional_tags, {
    name = local.name
  })
}
