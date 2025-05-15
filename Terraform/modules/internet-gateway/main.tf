resource "aws_internet_gateway" "cbc-igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.namespace}-igw"
  }
}