terraform {
  backend "s3" {
    bucket  = "terraform-project1-tfstate"
    key     = "backend/terraform-project1.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}