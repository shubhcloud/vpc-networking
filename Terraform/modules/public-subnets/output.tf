output "public_subnet_id" {
  value = aws_subnet.cbc-public-subnet.*.id
}

output "depends_on_public_subnet_id" {
  value = aws_subnet.cbc-public-subnet.id
}