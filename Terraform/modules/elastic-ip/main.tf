resource "aws_eip" "cbc-eip-nat" {
  domain = "vpc"
  tags = {
    Name = "${var.namespace}-eip"
  }
}