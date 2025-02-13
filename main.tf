terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}
provider "aws" {
  region = var.my_region
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "myec2" {
  ami           = var.my_ami
  instance_type = "t2.micro"
  tags = {
    Name = "myinstance "
  }
}
variable "my_region" {
   type = string
  default = "us-east-1"
}
variable "access_key" { }
variable "secret_key" { }
variable "my_ami" {
   type = string
   default = "ami-04b4f1a9cf54c11d0"
}
