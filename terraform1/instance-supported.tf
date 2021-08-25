#get the list of az in a specific region
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

#check if the repective instance type is supporte in that specific region or not
data "aws_ec2_instance_type_offering" "my_inst_type" {
for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

#all az mapped to supported instance type
output "output_v3_1" {
  value = {
      for az, details in data.aws_ec2_instance_type_offering.my_inst_type: az => details.instance_type
  }
}

#exclude un supported data center
output "output_v3_2" {
  
    value = keys({for az, details in data.aws_ec2_instance_type_offering.my_inst_type: 
      az => details.instance_type if length(details.instance_type) !=0})
}