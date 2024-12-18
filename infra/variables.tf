variable "aws_profile" {}

variable "aws_region" {}

variable "project_name" {}

variable "vpc_cidr" {}

variable "public_subnet_cidr" {
     type = list(string)
   
}
variable "us_az" {
    type = list(string)
    default = [ "" ]
    
}


variable "private_subnet_cidr" {
     type = list(string)
    
}



variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "key_name" {
    type = string
}


variable "subnet_id" {
    type = string
    default = ""
}


variable "enable_public_ip" {
    type = bool
    default = "false"
}


variable "vpc_id" {
  type = string
  default = ""
}

variable "lb_sg_id" {
    type = list(string)
    default = [ "" ]
}

variable "lb_subnet_id" {
    type = list(string)
    default = [ "" ]
}

variable "lb_type" {
  
}
variable "lb_listner_port" {
    type = number
    default = 80
   
}
variable "lb_listner_protocol" {
    type = string
    default = ""
}
variable "lb_listner_default_action" {
    type = string
    default = ""
}


variable "lb_target_group_name" {
  type = string
  default = ""
}
variable "lb_target_group_port" {
  type = number
  default = 8080
 
}
variable "lb_target_group_protocol" {
  type = string
  default = ""
}
variable "lb_target_group_attachment_port" {
  type = number
  default = 8080
 
}
variable "lb_https_listner_port" {}
variable "lb_https_listner_protocol" {}
variable "acm_arn" {
  type = string
  default = ""
}

variable "domain_name" {
  
}
