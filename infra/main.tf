provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "Senora-dev/vpc/aws"
  name = "${var.app_name}-${var.env}-vpc"
  cidr = "10.0.0.0/16"
}

module "security_group" {
  source = "Senora-dev/security-group/aws"
  name = "${var.app_name}-${var.env}-sg"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [{
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.app_name}-${var.env}-cluster"
}

resource "aws_rds_instance" "app_db" {
  count = var.env == "prod" ? 1 : 0  # only create in prod
  identifier = "${var.app_name}-${var.env}-db"
  engine = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "admin"
  password = "${var.rds_password}"
  db_subnet_group_name = module.vpc.db_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]
}

# ECS Service and Task Definition would go here

module "codepipeline" {
  source = "Senora-dev/codepipeline/aws"
  name = "${var.app_name}-${var.env}-pipeline"
  # Define stages and actions for your pipeline
}