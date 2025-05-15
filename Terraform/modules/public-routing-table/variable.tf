variable "vpc_id" {}
variable "namespace" {}
variable "igw_id" {}

variable "public_subnet_id" {
    type = list(string)
}