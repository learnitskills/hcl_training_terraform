resource "aws_instance" "my-ec2-vm" {
  ami = data.aws_ami.amznlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #for list
  key_name = "terraform-key"
  instance_type = var.instance_type
  #count = terraform.workspace == "default" ? 2:1
  #user_data = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
  
  tags = {
    "Name" = "vm-${terraform.workspace}-0"
  }

  #connection block for provisoner to connect to your ec2 instance 
  connection {
    type = "ssh"
    host = self.public_ip #understand hwat is self aws_instance.my-ec2-vm.*.public_ip
    #selc.publicip same aws_instance.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }
  #ec2-user this user do not have any direct access to copy file in any other folder except tmp direct
  #now we can copy the file
  provisioner "file" {
    source = "app/file-copy.html" #local machine 
    destination = "/tmp/file-copy.html" #remote machine
  }
  #copy the file to apache webserver /var/www/html directory
  provisioner "remote-exec" {
    inline = [
       #we are ensuring that apache server is provison using user_data
      "sudo cp /tmp/file-copy.html /var/www/html", #remote-exec always execute inside your vm
      "sudo yum install tree -y",
      "sudo amazon-linux-extras install docker -y",
      "sleep 90",
      "sudo service docker start",
       "sudo usermod -a -G docker ec2-user",
       "sudo chkconfig docker on",
       "sudo docker container run --publish 80:80 --detach --name webhost nginx",
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.my-ec2-vm.private_ip} >> creation-time-private-ip.txt"
    working_dir = "local-exec-output-file/"
    
  }
  provisioner "local-exec" {
   when = destroy
   command = "echo this instance is destroyed 'date' >> destroy-time.txt"
   working_dir = "local-exec-output-file/"
  }
}

















