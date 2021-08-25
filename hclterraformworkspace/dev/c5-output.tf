output "ec2_instance_public_ip" {
  value = aws_instance.my-ec2-vm.*.public_ip
}

output "ec2_instance_public_dns" {
  value = aws_instance.my-ec2-vm.*.public_dns
}
