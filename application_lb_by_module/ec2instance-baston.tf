module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name = "${var.environment}-BastionHost"
  #instance_count = 1
  ami = data.aws_ami.amznlinux2.id 
  instance_type = var.instance_type
  #key_name
  #monitoring = true
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public-bastion-sg.this_security_group_id]
  tags = local.common_tags
}