#create vpc terraform module
module "vpc" {
    source =  "terraform-aws-modules/vpc/aws"
    version = "3.6.0"
    cidr = var.vpc_cidr_block
    name = "${local.name}-${var.vpc_name}" #dev-sap-myvpc
    azs             = var.vpc_availability_zones
    private_subnets = var.vpc_private_subnets
    public_subnets  = var.vpc_public_subnets
#database subnet
    database_subnets = var.vpc_database_subnets
    create_database_subnet_group = var.vpc_create_database_subnet_group
    create_database_subnet_route_table = var.vpc_create_database_subnet_route_table


    enable_nat_gateway = var.vpc_enable_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

    #vpc dns parameters
    enable_dns_support = true 
    enable_dns_hostnames= true
    tags = local.common_tags
    vpc_tags = local.common_tags
    #addtional tags
    public_subnet_tags = {
        Type = "Public Subnet"
    }
    private_subnet_tags = {
        Type = "private Subnet"
    }
    database_subnet_tags = {
        Type = "database subnet"
    }
}