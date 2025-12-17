terraform {
  backend "s3" {
    bucket = "senora-terraform-state-ecs-fargate-in-vpc-694297f9dc4f75f648a298ff"
    key     = "ecs-fargate-in-vpc/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}