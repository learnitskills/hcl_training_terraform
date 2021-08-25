resource "aws_instance" "my-ec2-vm" {
  ami = data.aws_ami.amznlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #for list
  instance_type = var.instance_type
  count = terraform.workspace == "default" ? 2:1
  user_data = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
  
  tags = {
    "Name" = "vm-${terraform.workspace}-${count.index}"
  }
}