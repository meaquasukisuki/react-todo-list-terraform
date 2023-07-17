resource "aws_instance" "react-todo-list" {
  instance_type          = var.instance_type # Replace with your desired instance type
  ami                    = var.ami
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "react-todo-list-web"
  }

  user_data = file("${path.module}/user_data.sh")
}