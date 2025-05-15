locals {
  public_subnet_count = length(var.az_count)
}

resource "aws_subnet" "cbc-public-subnet" {
  vpc_id            = var.vpc_id
  count             = local.public_subnet_count
  cidr_block        = "10.0.${count.index+1}.0/24"
  availability_zone = "${element(var.az_count, count.index)}"

  tags = {
    Name = "${var.namespace}-public-subnet-${element(var.az_count, count.index)}"
  }
  map_public_ip_on_launch = true
}