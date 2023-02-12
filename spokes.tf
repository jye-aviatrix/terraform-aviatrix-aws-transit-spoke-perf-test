# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}


module "client_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.client_spoke_vpc_name
  cidr = "10.100.0.0/16"

  azs            = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets = ["10.100.128.0/18", "10.100.192.0/18"]

}

module "server_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.server_spoke_vpc_name
  cidr = "10.200.0.0/16"

  azs            = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets = ["10.200.128.0/18", "10.200.192.0/18"]

}

module "mc-spoke-client" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.5.0"
  cloud   = "AWS"
  region  = var.region

  account    = var.aviatrix_access_account
  transit_gw = module.mc-transit.transit_gateway.gw_name

  use_existing_vpc = true
  vpc_id           = module.client_vpc.vpc_id
  gw_subnet        = "10.100.0.0/26"
  hagw_subnet      = "10.100.64.0/26"

  name = module.client_vpc.name

  gw_name       = var.client_spoke_gw_name
  instance_size = var.client_server_spoke_gw_instance_size
  insane_mode   = true
}

module "mc-spoke-server" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.5.0"
  cloud   = "AWS"
  region  = var.region

  account    = var.aviatrix_access_account
  transit_gw = module.mc-transit.transit_gateway.gw_name

  use_existing_vpc = true
  vpc_id           = module.server_vpc.vpc_id
  gw_subnet        = "10.200.0.0/26"
  hagw_subnet      = "10.200.64.0/26"

  name = module.server_vpc.name

  gw_name       = var.server_spoke_gw_name
  instance_size = var.client_server_spoke_gw_instance_size
  insane_mode   = true
}
