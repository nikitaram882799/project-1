variable "vpc_cidr" {}

variable "project_name" {}

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



