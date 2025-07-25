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
  project = "project-01"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2
  tags = {
    Name = "${local.project}-subnet-${count.index + 1}"
  }
}

#Craeting 4 instance, 2 in each subnet
resource "aws_instance" "main" {
  count = length(var.ec2_config)
  ami = var.ec2_config[count.index].ami 
  instance_type = var.ec2_config[count.index].instance_type
  subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))
  #0 % 2 = 0
  #1 % 2 = 1

  tags = {
    Name = "${local.project}-instance-${count.index + 1}"
  }
}

output "aws_subnet_id" {
  value = aws_subnet.main[*].id
}