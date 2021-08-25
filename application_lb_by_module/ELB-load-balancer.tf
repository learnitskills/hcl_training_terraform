module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.16.0" #this is also not inportant
  # insert the 6 required variables here
  name = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id 
  subnets = [
     module.vpc.public_subnets[0],
     module.vpc.public_subnets[1]
  ]
  security_groups = [module.loadbalancer_sg.this_security_group_id]
  #internal = true
  http_tcp_listeners = [
      {
      port = 80
      protocol = "HTTP"
      target_group_index = 0 #current we are adding one target group
      }
  ]
  #Target Group
  #app1 target group
  target_groups = [
  {
   name_prefix = "app1-"    
   backend_protocol = "HTTP"
   backend_port = 80
   target_type = "instance"
   derigestration_delay = 10
   health_check = {
       enable = true 
       interval = 30
       path = "/app1/index.html"
       port = "traffic-port"
       healthy_threshold = 3
       unhealthy_threshold = 3
       timeout = 6
       protocol = "HTTP"
       matcher = "200-399"
   }
   protocol_version = "HTTP1"
   #App1 Target Group
   target = {
       my_app1_vm1 = {
           target_id = module.ec2_private.id[0]
           port = 80
       },
       my_app2_vm2 = {
           target_id = module.ec2_private.id[1]
           port = 80
       }
   }
   tags = local.common_tags
 }     
]
   tags = local.common_tags
}