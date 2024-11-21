terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
 }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "20.20.0.0/16"
  instance_tenancy = "default"
  tags             = merge(local.mycommon_tags, { Name = "myvpc" })
 }
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "20.20.1.0/24"
  tags             = merge(local.mycommon_tags, { Name = "public" })
}
locals {
  mycommon_tags = {
    owner = "Shubham"
    project = "fusion"
    location = "pune"
  }
}