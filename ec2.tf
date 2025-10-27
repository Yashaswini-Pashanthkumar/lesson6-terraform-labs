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

resource "aws_instance" "lesson6_ec2" {
ami = "ami-0c7217cdde317cfec" # Amazon Linux 2023 (us-east-1)
instance_type = "t2.micro"
key_name = "MyKeyPair" # change to your actual key name

tags = {
Name = "Lesson6-EC2"
}
}
