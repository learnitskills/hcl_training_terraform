#Terrform Setting Block
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
    
  }
  backend "s3" {
  bucket = "rajatchauhan"
  key = "tf/rajat.tf"
  region = "us-east-2"
  dynamodb_table = "rajat9828"
 }
}
#adding backend s3 bucket for remote state storage

#Provider Block
provider "aws"{
    profile = "default"
    region = var.aws_region
}
