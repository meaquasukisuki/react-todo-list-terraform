resource "aws_security_group" "jenkins-sg" {
  name        = "Allow web traffic"
  description = "inbound ports for ssh and standard http and everything outbound"
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
    #   replace with secure ip
      cidr_blocks = ["${var.myIp}/32"]
    }
  }

# whatever, jenkins can access the whole internet.
# if not, config this.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name"      = "Jenkins-sg"
    "Terraform" = "true"
  }
}