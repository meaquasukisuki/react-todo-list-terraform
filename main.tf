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

# create security group
module "react-todo-list-sg" {
  source = "./modules/react-todo-list/security_group"
  web_port = 8000
}

# Create an EC2 instance
module "react-todo-list-ec2" {
  source = "./modules/react-todo-list/ec2_instance"
  security_group_id = module.react-todo-list-sg.security_group_id
}
