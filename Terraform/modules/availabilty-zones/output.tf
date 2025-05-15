output "az_count" {
  value = "${length(aws_availability_zones.available.names)}"
}