variable "region" {default = ""}
variable "vpc_cidr" {default = ""}
variable "vpc_id" {default = ""}
variable "namespace" {default = ""}
variable "igw_id" {default = ""}
variable "eip_id" {default = ""}
variable "depends_on_public_subnet_id" {default = ""}

variable "nat_gateway_id" {
    type = list(string) 
    default = []
}

variable "az_count" {
    type = list(string) 
    default = []
}

variable "private_subnet_id" {
    type = list(string) 
    default = []
}

variable "public_subnet_id" {
    type = list(string) 
    default = []
}
