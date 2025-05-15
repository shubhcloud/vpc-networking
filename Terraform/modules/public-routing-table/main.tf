resource "aws_route_table" "public-cbc-rt" {
  vpc_id = var.vpc_id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    "Name" = "${var.namespace}-public-rt"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  subnet_id = var.public_subnet_id
  route_table_id = aws_route_table.public-cbc-rt.id
}