variable "vpc_id" {
  type = string
  default = ""
}



variable "is_external" {
    type = bool
    default = false
  
}

variable "lb_type" {
    type = string
    default = ""
}

variable "lb_sg_id" {
    type = set(string)
    default = [ "" ]
}

variable "lb_subnet_id" {
    type = set(string)
    default = [ "" ]
}

variable "project_name" {}

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

variable "jenkins_ec2_id" {
  
}
variable "lb_https_listner_port" {}
variable "lb_https_listner_protocol" {}
variable "acm_arn" {
  type = string
  default = ""
}
