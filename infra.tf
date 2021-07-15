module "vpc" {
  source = "github.com/felipesqf/terraform-fargate"
    region = var.region
    availability_zone = var.availability_zone
    vpc_name = var.vpc_name
    vpc_cidr = var.vpc_cidr
    secure_cidr = var.secure_cidr
    private_cidr = var.private_cidr
    public_cidr = var.public_cidr
}
