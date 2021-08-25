module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name = "${var.environment}-vm"
  ami = data.aws_ami.amznlinux2.id 
  instance_type = var.instance_type
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  subnet_ids = [
              module.vpc.public_subnets[0],
              module.vpc.public_subnets[1]
  ]
  instance_count  = var.private_instance_count
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}