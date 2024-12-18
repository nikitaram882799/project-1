variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "key_name" {
    type = string
}

variable "project_name" {
    type = string
}

variable "enable_public_ip" {
    type = bool
}

variable "subnet_id" {
    type = string
    default = ""
}

variable "sg_id" {
  type = list(string)
  default = [ "" ]
}






