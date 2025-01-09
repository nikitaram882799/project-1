terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.80.0"
    }
  }
  required_version = "= 1.10.2"
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

