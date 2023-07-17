variable "sg_name" {
  description = "react todo list security group"
  type        = string
  default = "react-todo-list-sg"
}

variable "web_port" {
  description = "react todo list runs on this port"
  type        = number
}

variable "ssh_port" {
  description = "react todo list runs on this port"
  type        = number
  default = 22
}

variable "sg_description" {
  description = "react todo list-web-sg"
  type        = string
  default = "react todo list-web-sg"
}

