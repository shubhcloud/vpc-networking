resource "aws_network_acl" "cbc-nacl" {
  vpc_id = var.vpc_id
  subnet_ids = var.public_subnet_id

  tags = {
    Name = "${var.namespace}-nacl"
  }

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  egress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }
}

