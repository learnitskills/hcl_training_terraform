#terraform output values
#ec2 instance pulbic ip

output "instance_publicip" {
  description = "Ec2 instance public ip"
  #value = [for instance in aws_instance.myec2vm: instance.public_ip]
  #terraform have somethign called as splat operator they are like wild card
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}

output "for_putput_map1" {
  description = "Ec2 instance public dns"
  #value = {for instance in aws_instance.myec2vm: instance.id=> instance.public_dns}
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}