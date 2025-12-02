output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_az_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_az_2.id
}
output "private_subnet_1_id" {
  value = aws_subnet.private_az_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_az_2.id
}

output "rds_availability_zone" {
  value = data.aws_availability_zones.available[0]
}

output "database_subnet_1_id" {
  value = aws_subnet.database_az_1.id
}

output "database_subnet_2_id" {
  value = aws_subnet.database_az_2.id
}

