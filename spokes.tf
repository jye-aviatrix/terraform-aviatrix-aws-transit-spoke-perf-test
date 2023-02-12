module "mc-spoke-client" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version       = "1.5.0"
  cloud         = "AWS"
  region        = var.region
  cidr          = "10.100.0.0/16"
  account       = var.aviatrix_access_account
  transit_gw    = module.mc-transit.transit_gateway.gw_name
  name          = var.client_spoke_vpc_name
  gw_name       = var.client_spoke_gw_name
  instance_size = var.client_server_spoke_gw_instance_size
  insane_mode   = var.client_server_spoke_insane_mode
}

module "mc-spoke-server" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version       = "1.5.0"
  cloud         = "AWS"
  region        = var.region
  cidr          = "10.200.0.0/16"
  account       = var.aviatrix_access_account
  transit_gw    = module.mc-transit.transit_gateway.gw_name
  name          = var.server_spoke_vpc_name
  gw_name       = var.server_spoke_gw_name
  instance_size = var.client_server_spoke_gw_instance_size
  insane_mode   = var.client_server_spoke_insane_mode
}