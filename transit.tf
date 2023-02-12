module "mc-transit" {
  source        = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version       = "2.4.1"
  cloud         = "AWS"
  region        = var.region
  cidr          = "10.0.0.0/23"
  account       = var.aviatrix_access_account
  insane_mode   = var.insane_mode
  instance_size = var.transit_instance_size
  name          = var.transit_vpc_name
  gw_name       = var.transit_gw_name
}
