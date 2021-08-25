module "public-bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 3 required variables here
  name = "public-bastion-sg"
  description = "Security Group with HTTP and SSH Port Open for entire vpc"
  vpc_id = module.vpc.vpc_id
  #ingress rule and CIDR block
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  tags = local.common_tags
}