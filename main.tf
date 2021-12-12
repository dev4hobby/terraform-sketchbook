terraform {
  cloud {
    organization = "d3fau1t"

    workspaces {
      name = "d3fau1t-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  profile = "d3fau1t"
  region  = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0eb14fe5735c13eb5"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0200688633249625e"]
  subnet_id              = "subnet-00e51774e331d98c7"

  tags = {
    Name = var.instance_name
  }
}