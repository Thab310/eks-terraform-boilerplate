# ============================================
# Public Subnets (for load balancers, NAT)
# ============================================
resource "aws_subnet" "public_az_1" {
  availability_zone               = data.aws_availability_zones.available.names[0]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.0.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = true

  tags = {
    Name                     = "public-${var.project_name}-1"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public_az_2" {
  availability_zone               = data.aws_availability_zones.available.names[1]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.1.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = true

  tags = {
    Name                     = "public-${var.project_name}-2"
    "kubernetes.io/role/elb" = 1
  }
}
# ============================================
# Private Subnets (for EKS nodes, apps)
# ============================================
resource "aws_subnet" "private_az_1" {
  availability_zone               = data.aws_availability_zones.available.names[0]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.2.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = false

  tags = {
    Name                              = "private-${var.project_name}-1"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_az_2" {
  availability_zone               = data.aws_availability_zones.available.names[1]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.3.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = false

  tags = {
    Name                              = "private-${var.project_name}-1"
    "kubernetes.io/role/internal-elb" = 1
  }
}
# ============================================
# Database Subnets (for RDS, ElastiCache, etc.)
# ============================================
resource "aws_subnet" "database_az_1" {
  availability_zone               = data.aws_availability_zones.available.names[0]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.4.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = false

  tags = {
    Name = "db-${var.project_name}-1"
    Type = "database"
  }
}

resource "aws_subnet" "database_az_2" {
  availability_zone               = data.aws_availability_zones.available.names[1]
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.0.5.0/32"
  assign_ipv6_address_on_creation = true #verify
  map_public_ip_on_launch         = false

  tags = {
    Name = "db-${var.project_name}-2"
    Type = "database"
  }
}

