variable "region" {
  default = "us-east-2"
}

variable "iperf_client_server_size" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Provide EC2 keypair name"
}

variable "number_of_iperf_client_server_pairs" {
  description = "Provide total number of client server pairs !!! Cost will increase when this number increases !!!"
  default     = 2
}

variable "aviatrix_access_account" {
  description = "Provide Aviatrix Access Account name"
}


variable "transit_instance_size" {
  description = "Instance size for transit GW, HPE suggest start with c5n.xlarge, non-HPE suggest start with t3.medium"
  default     = "c5n.xlarge"
}

variable "transit_vpc_name" {
  description = "Provide name for Transit VPC"
  default     = "iperf-test-transit"
}

variable "transit_gw_name" {
  description = "Provide Transit Gateway name"
  default     = "iperf-test-transit"
}

variable "client_spoke_vpc_name" {
  description = "Provide name for client spoke VPC"
  default     = "iperf-test-client"
}

variable "client_spoke_gw_name" {
  description = "Provide client spoke gateway name"
  default     = "iperf-client-spoke"
}

variable "server_spoke_vpc_name" {
  description = "Provide name for server spoke VPC"
  default     = "iperf-test-server"
}

variable "server_spoke_gw_name" {
  description = "Provide server spoke gateway name"
  default     = "iperf-server-spoke"
}

variable "client_server_spoke_gw_instance_size" {
  description = "Provide spoke gateway instance size for both client/server spoke"
  default     = "t3.medium"
}


variable "server_iperf_command" {
  description = "The command running on iperf server"
  default     = "iperf3 -s"
}

variable "client_iperf_additionl_parameters" {
  description = "Additional parameters that will append after 'iperf 3 -c <server_ip>', please start with whitespace, eg ' -u' to use UDP, make sure to change server side command to match the switch"
  default     = ""
}