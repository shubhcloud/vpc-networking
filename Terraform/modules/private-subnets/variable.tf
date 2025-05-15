variable "vpc_id" {}
variable "namespace" {}
variable "az_count" {type = list(string)}
variable "depends_on_public_subnet_id" {}