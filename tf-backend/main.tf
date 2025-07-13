
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
  backend "s3" {
    bucket         = "demo-bucket-76b26884690feb00"
    key            = "backend.tfstate"
    region         = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0b4fbd58a32e7ef15" 
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer"
  }
}