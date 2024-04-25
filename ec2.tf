# Terraform Configure setting block
terraform {
  required_providers {
    aws = {

      source  = "hashicorp/azure"
      
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" 

  region  = "ap-south-1"
}

#Resource Block
resource "aws_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 

  instance_type = "t3.medium"


}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.5.0.0/16"   
  azs                 = ["us-east-1a"]
  private_subnets     = ["10.5.1.0/24"]
  public_subnets      = ["10.5.101.0/24"]

#new comment added 
