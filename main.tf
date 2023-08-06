terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Define the AWS provider
provider "aws" {
  region = var.aws_region # Replace with your desired AWS region
}


module "aws_s3_practice" {
  source = "./modules/aws_examples/s3_practice"
}

