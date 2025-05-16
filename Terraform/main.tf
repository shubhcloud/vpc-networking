terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

module "availability-zones" {
  source = "./modules/availabilty-zones"  
}

module "vpc" {
  source = "./modules/vpc"
  namespace = var.namespace
  vpc_cidr = var.vpc_cidr
}

module "public-subnet" {
  source = "./modules/public-subnets"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
  az_count = module.availability-zones.az_count
}

module "private-subnet" {
  source = "./modules/private-subnets"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
  az_count = module.availability-zones.az_count
  depends_on = [ module.public-subnet ]
}

module "internet-gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
}

module "eip" {
  source = "./modules/elastic-ip"
  namespace = var.namespace
  private_subnet_id = module.private-subnet.private_subnet_id
}

module "public-routing-table" {
  source = "./modules/public-routing-table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet-gateway.igw_id
  namespace = var.namespace
  public_subnet_id = module.public-subnet.public_subnet_id
}

module "private-routing-table" {
  source = "./modules/private-routing-table"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
  nat_gateway_id = module.nat-gateway.nat_gateway_id
  private_subnet_id = module.private-subnet.private_subnet_id
}

module "nat-gateway" {
  source = "./modules/nat-gateway"
  igw_id = module.internet-gateway.igw_id
  private_subnet_id = module.private-subnet.private_subnet_id
  eip_id = module.eip.eip_id
  namespace = var.namespace
  depends_on = [ module.eip ]
}

module "public-nacl" {
  source = "./modules/public-nacl"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
  public_subnet_id = module.public-subnet.public_subnet_id
}

module "security-froup" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
  namespace = var.namespace
}