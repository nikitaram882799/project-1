

output "dev_sg" {
  value = aws_security_group.dev_sg.id
}

output "rds_mysql_sg_id" {
  value = aws_security_group.rds_mysql_sg.id
}

output "python_api_sg" {
  value = aws_security_group.python_api_sg.id
}