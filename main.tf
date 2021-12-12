terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "d3fau1t"
  region  = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0055a13f41d3f6cba"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0200688633249625e"]
  subnet_id = "subnet-00e51774e331d98c7"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}