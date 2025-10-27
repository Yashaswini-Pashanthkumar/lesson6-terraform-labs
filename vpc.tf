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

resource "aws_vpc" "lesson6_vpc" {
cidr_block = "10.0.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
tags = { Name = "Lesson6-VPC" }
}

resource "aws_subnet" "public_subnet" {
vpc_id = aws_vpc.lesson6_vpc.id
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = true
availability_zone = "us-east-1a"
tags = { Name = "Lesson6-Public-Subnet" }
}

resource "aws_subnet" "private_subnet" {
vpc_id = aws_vpc.lesson6_vpc.id
cidr_block = "10.0.2.0/24"
availability_zone = "us-east-1b"
tags = { Name = "Lesson6-Private-Subnet" }
}
