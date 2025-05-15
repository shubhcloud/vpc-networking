resource "aws_vpc" "cbc-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.namespace}-vpc"
  }
}
