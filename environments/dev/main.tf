terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}



module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  name          = "dev-instance-7137"
  environment   = "dev"
}

module "s3" {
  source        = "../../modules/s3"
  bucket_name   = "dev-bucket-7137"
  environment   = "dev"
}
