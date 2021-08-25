variable "aws_region" {
    type = string
    default = "eu-west-1"
}
variable "instance_type" {
    type = string
    description = "(optional) describe your variable"
    default = "t2.micro"
}