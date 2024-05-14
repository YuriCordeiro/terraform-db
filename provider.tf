# Define the MongoDB Atlas and AWS Providers
terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  
  required_version = ">= 0.13"

  cloud {
    organization = "Postech-YJ"

    workspaces {
      name = "order-manager"
    }
  }
}

  provider "aws" {
    region  = var.aws_region
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
  }

  provider "mongodbatlas" {
      public_key = var.mongodbatlas_public_key
      private_key  = var.mongodbatlas_private_key
  }