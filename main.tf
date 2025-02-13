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
  key_name = "mytf-key"
provisioner "local-exec" {
   command = "echo ${aws_instance.myec2.public_ip} > ip.txt"
}
}
variable "my_region" {
  type = string
  default = "us-east-1"
}
varible "access_key" { }
varible "secret_key" { } 
   type = string
   default = "ami-085ad6ae776d8f09c"
