# main.tf

provider "aws" {
  region = "ap-south-1"  # Change to your desired AWS region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source = "./modules/route_tables"
  vpc_id = module.vpc.vpc_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instances" {
  source = "./modules/ec2_instances"
  subnet_id = module.subnets.subnet_a_id
  security_group_ids = toset([module.security_groups.web_sg_id])
}
