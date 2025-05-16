variable "igw_id" {}
variable "namespace" {}
variable "eip_id" {
   type = list(string)
}

variable "public_subnet_id" {
    type = list(string) 
}