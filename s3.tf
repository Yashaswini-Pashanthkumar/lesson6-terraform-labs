terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.0"
}
}
}

provider "aws" {
region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
bucket = "yashaswini-lesson6-bucket-12345" # must be globally unique (change the numbers)
tags = {
Name = "Lesson6-S3"
}
}

resource "aws_s3_bucket_versioning" "enable" {
bucket = aws_s3_bucket.my_bucket.id
versioning_configuration {
status = "Enabled"
}
}
