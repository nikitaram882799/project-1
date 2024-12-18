terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.3"
    }
  }
  required_version = "= 1.6.2"
}

provider "aws" {
  region                   = var.aws_region
  profile                  = var.aws_profile
}

