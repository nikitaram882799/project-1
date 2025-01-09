terraform {
  backend "s3" {
    bucket  = "terraform-project1-tfstate"
    key     = "backend/terraform-project1.tfstate"
    region  = "us-west-2"
    profile = "profile demo"
  }
}