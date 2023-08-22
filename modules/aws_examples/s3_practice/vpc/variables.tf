variable "vpc_cidr_block" {
  type        = string
  description = "vpc cidr block"
  default     = "10.16.0.0/16"
}

variable "subnetA_cidr_blocks" {
  type        = map(string)
  description = "subnetA cidr blocks"
  default = {
    subnet_A_reserved = "10.16.0.0/20"
    subnet_A_db       = "10.16.16.0/20"
    subnet_A_app      = "10.16.32.0/20"
    subnet_A_web      = "10.16.48.0/20"
  }
}

variable "subnetB_cidr_blocks" {
  type        = map(string)
  description = "subnetB cidr blocks"
  default = {
    subnet_B_reserved = "10.16.64.0/20"
    subnet_B_db       = "10.16.80.0/20"
    subnet_B_app      = "10.16.96.0/20"
    subnet_B_web      = "10.16.112.0/20"
  }
}

variable "subnetC_cidr_blocks" {
  type        = map(string)
  description = "subnetC cidr blocks"
  default = {
    subnet_C_reserved = "10.16.128.0/20"
    subnet_C_db       = "10.16.144.0/20"
    subnet_C_app      = "10.16.160.0/20"
    subnet_C_web      = "10.16.176.0/20"
  }
}

variable "web_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.16.48.0/20", "10.16.112.0/20", "10.16.176.0/20"]
}

variable "db_subnet_cidrs" {
  type        = list(string)
  description = "DB Subnet CIDR values"
  default     = ["10.16.16.0/20", "10.16.80.0/20", "10.16.144.0/20"]
}

variable "app_subnet_cidrs" {
  type        = list(string)
  description = "app Subnet CIDR values"
  default     = ["10.16.32.0/20", "10.16.96.0/20", "10.16.160.0/20"]
}

variable "reserved_subnet_cidrs" {
  type        = list(string)
  description = "reserved Subnet CIDR values"
  default     = ["10.16.0.0/20", "10.16.64.0/20", "10.16.128.0/20"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnetA_cidrs" {
  type        = list(string)
  description = "private subnetA subnets"
  default     = ["10.16.16.0/20", "10.16.32.0/20"]
}

variable "private_subnetB_cidrs" {
  type        = list(string)
  description = "private subnetB subnets"
  default     = ["10.16.80.0/20", "10.16.96.0/20"]
}

variable "private_subnetC_cidrs" {
  type        = list(string)
  description = "private subnetC subnets"
  default     = ["10.16.144.0/20", "10.16.160.0/20"]
}
