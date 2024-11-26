variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "192.168.0.0/16"
}

variable "subnet_cidr_block" {
  default = "192.168.0.0/24"
}

variable "tags" {
  type    = map(string)
  default = {
    Environment = "prod"
  }
}

variable "igw_destination_cidr" {
    type = string
    default = "0.0.0.0/0"
}

