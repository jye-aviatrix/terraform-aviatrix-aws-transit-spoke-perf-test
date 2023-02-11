variable "client_name" {
    default = "iperf_client"  
}

variable "server_name" {
  default = "iperf_server"
}

variable "iperf_client_server_size" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Provide EC2 keypair name"
}

variable "client_vpc_id" {
    description = "Provide VPC ID for iperf client"  
}

variable "server_vpc_id" {
    description = "Provide VPC ID for iperf server"  
}

variable "client_subnet_id" {
    description = "Provide subnet ID for iperf client"  
}

variable "server_subnet_id" {
    description = "Provide subnet ID for iperf server"  
}

variable "server_iperf_command" {
  description = "The command running on iperf server"
  default = "iperf3 -s"
}

variable "client_iperf_additionl_parameters" {
  description = "Additional parameters that will append after 'iperf 3 -c <server_ip>', please start with whitespace, eg ' -u' to use UDP, make sure to change server side command to match the switch"
  default = ""
}

