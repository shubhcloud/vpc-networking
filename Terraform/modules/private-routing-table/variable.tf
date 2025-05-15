variable "vpc_id" {}
variable "namespace" {}
variable "nat_gateway_id" {
    type = list(string)
}

variable "private_subnet_id" {
    type = list(string)
}

