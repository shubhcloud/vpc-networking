resource "aws_route_table" "private-cbc-rt" {
  vpc_id = var.vpc_id
  count  = length(var.nat_gateway_id)
  route { 
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id[count.index]
  }
  tags = {
    "Name" = "${var.namespace}-private-rt"
  }
}

resource "aws_route_table_association" "private-rt-association" {
  count           = length(var.private_subnet_id)
  subnet_id       = var.private_subnet_id[count.index]
  route_table_id  = element(aws_route_table.private-cbc-rt.*.id, count.index) // 3 rt as we have 3 nat gateway per subnet in different AZs.
}