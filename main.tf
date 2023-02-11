module "iperf_client_server" {
  count                             = var.number_of_iperf_client_server_pairs
  source                            = "./modules/iperf_client_and_server"
  client_name                       = "iperf_client${count.index}"
  server_name                       = "iperf_server${count.index}"
  client_vpc_id                     = module.vpc.vpc_id
  server_vpc_id                     = module.vpc.vpc_id
  client_subnet_id                  = module.vpc.public_subnets[0]
  server_subnet_id                  = module.vpc.public_subnets[1]
  iperf_client_server_size          = var.iperf_client_server_size
  key_name                          = var.key_name
  server_iperf_command              = "iperf3 -s -p 8000 --logfile /home/ubuntu/iperf3.log"
  client_iperf_additionl_parameters = " -p 8000 --logfile /home/ubuntu/iperf3.log"
}
