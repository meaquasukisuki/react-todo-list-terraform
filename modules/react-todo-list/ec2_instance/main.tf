resource "aws_instance" "react-todo-list" {
  instance_type          = var.instance_type 
  ami                    = var.ami
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "react-todo-list-web"
  }

  key_name = "A4L"

  user_data = file("${path.module}/user_data.sh")
}