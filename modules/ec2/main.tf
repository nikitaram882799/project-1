resource "aws_instance" "jenkins_ec2" {

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.sg_id
    associate_public_ip_address = var.enable_public_ip
    user_data = templatefile("${path.module}/templates/user_data.sh", {})


    tags = {
      Name = "${var.project_name}-jenkins-ec2"
    }
  
}



