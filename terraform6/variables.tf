variable "bucket_name" {
  type = string
}
variable "tags" {
  type = map(string)
  default  = {}
}
variable "aws_region" {
  default = "us-east-1"
}