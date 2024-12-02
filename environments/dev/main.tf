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
  source      = "../../modules/ec2"
  instances   = [
    { ami_id = "ami-0dee22c13ea7a9a67", instance_type = "t2.micro", name = "dev-instance-1" },
    { ami_id = "ami-0dee22c13ea7a9a67", instance_type = "t2.medium", name = "dev-instance-2" },
    { ami_id = "ami-0dee22c13ea7a9a67", instance_type = "t2.micro", name = "dev-instance-3" },
    { ami_id = "ami-0dee22c13ea7a9a67", instance_type = "t2.medium", name = "dev-instance-4" }
  ]
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

