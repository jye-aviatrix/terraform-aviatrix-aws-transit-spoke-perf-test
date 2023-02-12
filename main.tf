module "iperf_client_server_az_a" {
  count                             = var.number_of_iperf_client_server_pairs
  source                            = "./modules/iperf_client_and_server"
  client_name                       = "iperf_client_az_a_${count.index}"
  server_name                       = "iperf_server_az_a_${count.index}"
  client_vpc_id                     = module.mc-spoke-client.vpc.vpc_id
  server_vpc_id                     = module.mc-spoke-server.vpc.vpc_id
  client_subnet_id                  = module.mc-spoke-client.vpc.public_subnets[0].subnet_id
  server_subnet_id                  = module.mc-spoke-server.vpc.public_subnets[0].subnet_id
  iperf_client_server_size          = var.iperf_client_server_size
  key_name                          = var.key_name
  server_iperf_command              = var.server_iperf_command
  client_iperf_additionl_parameters = var.client_iperf_additionl_parameters
}

module "iperf_client_server_az_b" {
  count                             = var.number_of_iperf_client_server_pairs
  source                            = "./modules/iperf_client_and_server"
  client_name                       = "iperf_client_az_b_${count.index}"
  server_name                       = "iperf_server_az_b_${count.index}"
  client_vpc_id                     = module.mc-spoke-client.vpc.vpc_id
  server_vpc_id                     = module.mc-spoke-server.vpc.vpc_id
  client_subnet_id                  = module.mc-spoke-client.vpc.public_subnets[1].subnet_id
  server_subnet_id                  = module.mc-spoke-server.vpc.public_subnets[1].subnet_id
  iperf_client_server_size          = var.iperf_client_server_size
  key_name                          = var.key_name
  server_iperf_command              = var.server_iperf_command
  client_iperf_additionl_parameters = var.client_iperf_additionl_parameters
}

