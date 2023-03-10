module "iperf_client_server_az_a" {
  count                             = var.number_of_iperf_client_server_pairs
  source                            = "./modules/iperf_client_and_server"
  client_name                       = "iperf_client_${count.index+1}_az_a"
  server_name                       = "iperf_server_${count.index+1}_az_a"
  client_vpc_id                     = module.client_vpc.vpc_id
  server_vpc_id                     = module.server_vpc.vpc_id
  client_subnet_id                  = module.client_vpc.public_subnets[0]
  server_subnet_id                  = module.server_vpc.public_subnets[0]
  iperf_client_server_size          = var.iperf_client_server_size
  key_name                          = var.key_name
  server_iperf_command              = var.server_iperf_command
  client_iperf_additionl_parameters = var.client_iperf_additionl_parameters
}

module "iperf_client_server_az_b" {
  count                             = var.number_of_iperf_client_server_pairs
  source                            = "./modules/iperf_client_and_server"
  client_name                       = "iperf_client_${count.index+1}_az_b"
  server_name                       = "iperf_server_${count.index+1}_az_b"
  client_vpc_id                     = module.client_vpc.vpc_id
  server_vpc_id                     = module.server_vpc.vpc_id
  client_subnet_id                  = module.client_vpc.public_subnets[1]
  server_subnet_id                  = module.server_vpc.public_subnets[1]
  iperf_client_server_size          = var.iperf_client_server_size
  key_name                          = var.key_name
  server_iperf_command              = var.server_iperf_command
  client_iperf_additionl_parameters = var.client_iperf_additionl_parameters
}

