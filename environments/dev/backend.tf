terraform {
  backend "s3" {
    bucket         = "dev-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
  }
}
