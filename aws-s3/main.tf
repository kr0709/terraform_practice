terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "random_id" "rand_id" {
  byte_length = 8
}
resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-bucket-${random_id.rand_id.hex}" # Ensure this bucket name is globally unique
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.demo-bucket.bucket
  source = "./myfile.txt"
  key = "mydata.txt"
}

output "random_id" {
  value = random_id.rand_id.hex
  description = "A random ID used to ensure unique bucket names"
  
}