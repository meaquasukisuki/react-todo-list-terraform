variable "instance_type" {
  type        = string
  description = "react-todo-list-ec2-instance-type"
  default     = "t2.micro"
}

variable "ami" {
  type        = string
  description = "react-todo-list-ec2-ami"
  default     = "ami-06ca3ca175f37dd66"
}

variable "jenkins_sg_id" {
    
}
