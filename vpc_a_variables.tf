# Variables for VPC_A

variable "vpc_a_name" {
  description = "Name of VPC"
  type        = string
  default     = "vpc-a"
}

variable "vpc_a_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_a_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_a_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vpc_a_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "vpc_a_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}