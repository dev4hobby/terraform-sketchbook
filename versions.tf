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
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
  required_version = ">= 1.1.0"
}