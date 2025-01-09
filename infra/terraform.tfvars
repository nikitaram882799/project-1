
aws_region = "us-west-2"
aws_profile = "demo"
project_name = "Dev-project"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
us_az = ["us-west-2a","us-west-2b"]

private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]


ami_id = "ami-0866a3c8686eaeeba"
key_name = "dev-key"
instance_type = "t2.medium"
enable_public_ip = "true"

lb_type                   = "application"
lb_listner_port           = 5000
lb_listner_protocol       = "HTTP"
lb_listner_default_action = "forward"
lb_target_group_port = 5000
lb_target_group_protocol = "HTTP"
lb_target_group_name = "dev-proj-lb-tg"
lb_target_group_attachment_port = 5000
lb_https_listner_port = "443"
lb_https_listner_protocol ="HTTPS"

domain_name = "mydevopstech.shop"



