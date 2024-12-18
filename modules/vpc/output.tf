output "dev_public_subnet" {
  value = aws_subnet.dev_public_subnet[*].id
}


output "vpc_id" {
  value = aws_vpc.vpc.id
}

