resource "aws_nat_gateway" "cbc-nat" {
  depends_on      = [ var.igw_id ]
  count           = length(var.private_subnet_id)
  subnet_id       = var.private_subnet_id[count.index]
  allocation_id = var.eip_id

  tags = {
    Name = "${var.namespace}-nat-gateway"
  }
}