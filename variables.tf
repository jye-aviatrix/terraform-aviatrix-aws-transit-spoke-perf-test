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

variable "insane_mode" {
  description = "Enable or disable insane mode / high performance encryption"
  default     = true
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

variable "client_server_spoke_insane_mode" {
  description = "Enable or disable insane mode / high performance encryption"
  default     = true
}
