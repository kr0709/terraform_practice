
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myserver" {
  ami = "ami-0b4fbd58a32e7ef15" 
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer"
  }
}