resource "aws_nat_gateway" "cbc-nat" {
  depends_on    = [ var.igw_id ]
  subnet_id     = var.private_subnet_id
  allocation_id = var.eip_id

  tags = {
    Name = "${var.namespace}-nat-gateway"
  }
}