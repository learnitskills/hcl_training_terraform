module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "3.0.0" #this is also not inportant
  # insert the 6 required variables here
  name = "${local.name}-elb"
  subnets = [
     module.vpc.public_subnets[0],
     module.vpc.public_subnets[1]
  ]
  security_groups = []
  #internal = true
  listener = [
      {
      instance_port = 80
      instance_protocol = "HTTP"
      lb_port = 80
      lb_protocol = "HTTP"
      },
      {
      instance_port = 80
      instance_protocol = "HTTP"
      lb_port = 81
      lb_protocol = "HTTP"
      },
  ]
  health_check = {
      target = "HTTP:80/"
      interval = 30
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 5
  }
  #Behind the load balancer we need to attach instance. 
  number_of_instances = var.private_instance_count
  instances = [
      module.ec2_private.id[0],
      module.ec2_private.id[1]
  ]
  tags = local.common_tags
}