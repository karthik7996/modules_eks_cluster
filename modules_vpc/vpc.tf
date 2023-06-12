resource "aws_vpc" "instance_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.value
  enable_dns_hostnames = var.value
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "my_vpc_public_subnet_001" {
  vpc_id                  = aws_vpc.instance_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = var.value

  tags = {
    Name = var.subent_name
  }
}

resource "aws_internet_gateway" "my_vpc_gw" {
  vpc_id = aws_vpc.instance_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = aws_vpc.instance_vpc.id
  route {
    cidr_block = var.cidr
    gateway_id = aws_internet_gateway.my_vpc_gw.id
  }
  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "my_vpc_association" {
  subnet_id      = aws_subnet.my_vpc_public_subnet_001.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}
###############################################################

resource "aws_subnet" "my_vpc_public_subnet_002" {
  vpc_id                  = aws_vpc.instance_vpc.id
  cidr_block              = var.subnet_cidr_block_002
  map_public_ip_on_launch = var.value

  tags = {
    Name = var.subent_name
  }
}

resource "aws_route_table_association" "my_vpc_association_002" {
  subnet_id      = aws_subnet.my_vpc_public_subnet_002.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}
