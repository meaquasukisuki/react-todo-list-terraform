resource "aws_instance" "jenkins-ec2" {
  instance_type          = var.instance_type 
  ami                    = var.ami
  vpc_security_group_ids = [var.jenkins_sg_id]

  tags = {
    Name = "jenkins-ec2"
  }

  user_data = file("${path.module}/user_data.sh")
}