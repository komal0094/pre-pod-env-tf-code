provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source            = "./modules/vpc"
  pub-snets         = var.public-sub
  pri-snets         = var.private-sub
  all_traffic_allow = var.igw-cidr
  vpc_cidr          = var.vpc-cidr
}