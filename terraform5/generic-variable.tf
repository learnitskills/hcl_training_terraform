variable "aws_region" {
    description = "region"
    type = string
    default = "us-east-2" #change your region
  
}
#environemnt varaible
variable "environment" {
  description = "Environment varaible used as prefix"
  type = string
  default = "dev"
}

#business devision
variable "business_devision" {
  description = "Business devision"
  type = string
  default = "SAP"
}

#dev-sap-
