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
  source   = "../../modules/ec2"
  instances = {
    instance1 = {
      ami_id        = "ami-0dee22c13ea7a9a67"
      instance_type = "t2.micro"
      name          = "dev-instance-1"
    },
    instance2 = {
      ami_id        = "ami-0dee22c13ea7a9a67"
      instance_type = "t2.micro"
      name          = "dev-instance-2"
    },
    # Add more instances as needed
    instance4 = {
      ami_id        = "ami-0dee22c13ea7a9a67"
      instance_type = "t2.micro"
      name          = "dev-instance-4"
    },
    instance5 = {
      ami_id        = "ami-0dee22c13ea7a9a67"
      instance_type = "t2.micro"
      name          = "dev-instance-5"
    }
  }
  environment = "dev"
}



module "s3" {
  source      = "../../modules/s3"
  bucket_names = {
    "bucket1" = { bucket_name = "dev-demo-buck-6721" },
    "bucket2" = { bucket_name = "dev-demo-buck-1241" },
    "bucket3" = { bucket_name = "dev-demo-buck-9021" },
    "bucket4" = { bucket_name = "dev-demo-buck-294" }
  }
  environment = "dev"
}

# module "vpc" {
#   source          = "../../modules/vpc"
#   environment     = "dev"
#   cidr_block      = "10.0.0.0/16"
#   public_subnet_cidr = "10.0.1.0/24"
#   private_subnet_cidr = "10.0.2.0/24"
#   availability_zone   = "ap-south-1"
# }