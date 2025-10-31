provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  project            = var.project
  create_internet_gateway = true
}

module "jenkins_master" {
  source            = "./modules/ec2-jenkins-master"
  ami               = var.master_ami
  instance_type     = var.master_instance_type
  subnet_id         = module.vpc.public_subnet_id
  key_pair          = var.key_pair
  security_group_id = module.vpc.jenkins_sg_id
  project           = var.project
}

module "jenkins_slave" {
  source            = "./modules/ec2-jenkins-slave"
  ami               = var.slave_ami
  instance_type     = var.slave_instance_type
  subnet_id         = module.vpc.public_subnet_id
  key_pair          = var.key_pair
  security_group_id = module.vpc.jenkins_sg_id
  project           = var.project
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "my_bucket" {
  bucket = "infra-tfstate-01"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket       = "infra-tfstate-01"
    key          = "terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}
