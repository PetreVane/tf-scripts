provider "aws" {
    region                    = var.region
}

module "vpc" {
  source                      = "./vpc"
}

module "security-group" {
  source                      = "./security-group"
  expected_vpc_id             = module.vpc.vpc_id
}

module "launch-template" {
  source                      = "./launch-template"
  image_id                    = "ami-0f673487d7e5f89ca"
  instance_type               = "t2.micro" # change it as you like
  aws_security_group_id       = module.security-group.aws_security_group_id
}

module "autoscaling-group" {
  source                      = "./autoscaling-group"
  aws_subnet_public_subnet-1  = module.vpc.tf-public-subnet-1-id
  aws_subnet_public_subnet-2  = module.vpc.tf-public-subnet-2-id
  launch-template-id          = module.launch-template.launch-template-id
  launch-template-version     = module.launch-template.launch-template-version-latest
  nlb-target-group-arn        = module.target-group.target-group-arn
}

module "target-group" {
  source                      = "./target-group"
  vpc_id                      = module.vpc.vpc_id
}

module "network-load-balancer" {
  source                      = "./network-load-balancer"
  nlb-subnet-1                = module.vpc.tf-public-subnet-1-id
  nlb-subnet-2                = module.vpc.tf-public-subnet-2-id
  target-group-arn            = module.target-group.target-group-arn
#   vpc_id                      = module.vpc.vpc_id
}