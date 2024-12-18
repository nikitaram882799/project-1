module "vpc" {
    source = "../modules/vpc"
    
    vpc_cidr = var.vpc_cidr
    us_az = var.us_az
    private_subnet_cidr = var.private_subnet_cidr
    public_subnet_cidr = var.public_subnet_cidr
    project_name = var.project_name
   
}

module "sg" {
    source = "../modules/sg"

    project_name = var.project_name
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "../modules/ec2"

    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    enable_public_ip = var.enable_public_ip
    project_name = var.project_name
    subnet_id = tolist(module.vpc.dev_public_subnet)[0]
    sg_id = [module.sg.dev_sg,module.sg.ec2_jenkins_port_8080,module.sg.python_api_sg]
    
}

module "alb" {
    source = "../modules/alb"

    jenkins_ec2_id = module.ec2.jenkins_ec2
    lb_target_group_port = var.lb_target_group_port
    lb_listner_default_action = var.lb_listner_default_action
    lb_target_group_protocol = var.lb_target_group_protocol
    lb_listner_port = var.lb_listner_port
    lb_listner_protocol = var.lb_listner_protocol
    lb_target_group_name = var.lb_target_group_name
    lb_target_group_attachment_port = var.lb_target_group_attachment_port
    lb_https_listner_port = var.lb_https_listner_port
    lb_https_listner_protocol = var.lb_https_listner_protocol
    acm_arn = module.acm.acm_arn
    lb_type = var.lb_type
    lb_sg_id =[module.sg.dev_sg]
    lb_subnet_id = tolist(module.vpc.dev_public_subnet)
    project_name = var.project_name
    vpc_id = module.vpc.vpc_id
  
}

module "route53" {
    source = "../modules/route53"
    domain_name = var.domain_name
    aws_lb_dns_name = module.alb.aws_lb_dns_name
    aws_lb_zone_id = module.alb.aws_lb_zone_id
  
}

module "acm" {
    source = "../modules/acm"
    domain_name = var.domain_name
    hosted_zone_id = module.route53.hosted_zone_id
}

module "rds" {
  source = "../modules/rds"
  db_subnet_group_name = "rds_subnet_group"
  subnet_groups        = tolist(module.vpc.dev_public_subnet)
  rds_mysql_sg_id      = module.sg.rds_mysql_sg_id
  mysql_db_identifier  = "mydb"
  mysql_username       = "dbuser"
  mysql_password       = "dbpassword"
  mysql_dbname         = "devprojdb"
}

