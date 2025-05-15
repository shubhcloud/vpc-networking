locals {
  private_subnet_count = length(var.az_count)
}

resource "aws_subnet" "cbc-private-subnet" {
  vpc_id            = var.vpc_id
  count             = local.private_subnet_count
  cidr_block        = "10.0.${count.index+4}.0/24"
  availability_zone = "${element(var.az_count, count.index)}"

  tags = {
    Name = "${var.namespace}-private-subnet-${element(var.az_count, count.index)}"
  }
  map_public_ip_on_launch = false 
}