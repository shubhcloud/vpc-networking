resource "aws_route_table" "private-cbc-rt" {
  vpc_id = var.vpc_id
  route { 
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }
  tags = {
    "Name" = "${var.namespace}-private-rt"
  }
}

resource "aws_route_table_association" "private-rt-association" {
  subnet_id = var.private_subnet_id
  route_table_id = aws_route_table.private-cbc-rt
}