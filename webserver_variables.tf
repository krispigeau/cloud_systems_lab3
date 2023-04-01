# General variables for webservers

variable "web_bootstrap" {
  description = "user data to bootstrap apache"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    systemctl restart httpd
    systemctl enable httpd
    EOF
}

variable "web_ami" {
  description = "user data to bootstrap apache"
  type        = string
  default     = "ami-00c39f71452c08778"
}

variable "web_chassis" {
  description = "type of chassis to use for webservers"
  type        = string
  default     = "t2.micro"
}

variable "web_key_name" {
  description = "public key to use for webservers"
  type        = string
  default     = "kris_desktop"
}



