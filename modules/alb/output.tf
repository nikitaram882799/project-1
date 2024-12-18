output "lb_target_group_arn" {
  value = aws_lb_target_group.lb_target_group.arn
}

output "aws_lb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "aws_lb_zone_id" {
  value = aws_lb.alb.zone_id
}