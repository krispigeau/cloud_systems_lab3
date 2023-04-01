module "vpc_1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = var.vpc_a_name
  cidr = var.vpc_a_cidr
  azs             = var.vpc_a_azs
  private_subnets = var.vpc_a_private_subnets
  public_subnets  = var.vpc_a_public_subnets
  enable_nat_gateway = var.vpc_a_enable_nat_gateway
}

module "lab3_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "lab3-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc_1.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

module "ec2_public" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "4.3.0"
  ami                    = "ami-00c39f71452c08778"
  instance_type          = "t2.micro"
  name                   = "${var.vpc_a_name}-public"
  vpc_security_group_ids = [module.lab3_sg.security_group_id]
  subnet_id              = module.vpc_1.public_subnets[0]
}