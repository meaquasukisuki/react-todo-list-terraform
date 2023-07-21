variable "ingressports" {
  type    = list(number)
  default = [22,80,8080,50000]
}

variable "myIp" {
    type = string
    description = "my local ip in tokyo"
    default = "localIp.txt"
}

