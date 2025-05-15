resource "aws_eip" "cbc-eip-nat" {
  count = length(var.private_subnet_id)
  domain = "vpc"
  tags = {
    Name = "${var.namespace}-eip-${count.index}"
  }
}