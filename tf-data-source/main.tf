terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

#AMIs
data "aws_ami" "name" {
    most_recent      = true
    owners           = ["amazon"]
    
}

output "ami_id" {
  value = data.aws_ami.name.id
}

#Security Group
data "aws_security_group" "name" {
    tags = {
      webserver = "http"
    }
    
}

output "security_group_id" {
  value = data.aws_security_group.name.id
}

#VPC
data "aws_vpc" "name" {
    tags = {
      Name = "my-vpc"
    }
}

output "vpc_id" {
  value = data.aws_vpc.name.id
}

#AZ
data "aws_availability_zones" "available" {
  state = "available"
}

output "name" {
  value = data.aws_availability_zones.available.names
}

#To get the account details
data "aws_caller_identity" "name" {
}

output "caller_info" {
  value = data.aws_caller_identity.name  
}

#To get region
data "aws_region" "name" {
}

output "region" {
  value = data.aws_region.name.name
}

# EC2 Instance
resource "aws_instance" "myserver" {
  ami = data.aws_ami.name.id
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer"
  }
}