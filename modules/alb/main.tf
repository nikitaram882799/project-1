resource "aws_lb" "alb" {

  internal = var.is_external
  load_balancer_type = var.lb_type
  security_groups = var.lb_sg_id
  subnets = var.lb_subnet_id
  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-lb"
  }
   
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.lb_listner_port
  protocol          = var.lb_listner_protocol

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = aws_lb_target_group.lb_target_group.arn

  }
}

resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = var.jenkins_ec2_id# Replace with your EC2 instance reference
  port             = var.lb_target_group_attachment_port
}



resource "aws_lb_target_group" "lb_target_group" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.lb_target_group_protocol
  vpc_id   = var.vpc_id
  health_check {
    path = "/login"
    port = 8080
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  # has to be HTTP 200 or fails
  }
}


# https listner on port 443
resource "aws_lb_listener" "lb_https_listner" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.lb_https_listner_port
  protocol          = var.lb_https_listner_protocol
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = var.acm_arn

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}