resource "aws_vpc" "main" {
  enable_dns_hostnames = true
  enable_dns_support   = true
  assign_generated_ipv6_cidr_block = true
  cidr_block           = "10.0.0.0/16"


  tags = {
    Name = "${var.project_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_az_1.id

  tags = {
    Name = "${var.project_name}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}



