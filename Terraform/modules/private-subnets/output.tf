output "private_subnet_id" {
  value = aws_subnet.cbc-private-subnet.*.id
}