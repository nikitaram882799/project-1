terraform {
  backend "s3" {
    bucket  = "terraform-project-demo-tfstate"
    key     = "backend/terraform-project-demo.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}