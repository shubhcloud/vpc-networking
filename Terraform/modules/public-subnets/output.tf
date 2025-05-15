output "public_subnet_id" {
  value = aws_subnet.cbc-public-subnet.*.id
}
