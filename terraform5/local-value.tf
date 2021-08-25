#we can define local values in terraform
locals {
    owners = var.business_devision
    environment = var.environment
    name = "${var.business_devision}-${var.environment}"
    #name = "${var.owner}-${local.environment}""
    common_tags = {
        owners = local.owners
        environment = local.environment
    }
}