provider "aws" {
  region = var.region
}

resource "aws_vpc" "example" {
  #name                 = var.name
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(var.tags, { Name = "example-vpc" })
}

resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "example-subnet" })
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags   = merge(var.tags, { Name = "example-igw" })
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id
  tags   = merge(var.tags, { Name = "example-route-table" })
}

resource "aws_route" "example" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = var.igw_destination_cidr
  gateway_id             = aws_internet_gateway.example.id
}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id
  route_table_id = aws_route_table.example.id
}
