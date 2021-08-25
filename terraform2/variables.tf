variable "aws_region" {
        description = "Region in which aws resource to be created"
        type = string
        default = "eu-central-1"
}

variable "instance_type" {
    description = "ec2 isntance type"
    type = string
    default = "t3.micro"
}

variable "instance_type_list" {
    description = "ec2 isntance type"
    type = list(string)
    default = ["t3.micro","t3.small","t3.large"]
}
variable "instance_type_map" {
  type = map(string)
  default = {
      "dev" = "t3.micro" #we store our map using key and value
      "qa" = "t3.small"
      "prod" = "t3.large"
  }
}