variable "instance_type" {
  type        = string
  description = "react-todo-list-ec2-instance-type"
  default     = "t2.medium"
}

variable "ami" {
  type        = string
  description = "react-todo-list-ec2-ami"
  default     = "ami-05548f9cecf47b442"
}

variable "jenkins_sg_id" {
    
}
