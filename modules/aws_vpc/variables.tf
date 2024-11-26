variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "tags" {
  type    = map(string)
  default = {
    Environment = "Development"
  }
}

variable "igw_destination_cidr" {
    type = string
    default = "0.0.0.0/0"
}

/*
variable "name" {
    type = string
    default = "vpn_test"
}
*/