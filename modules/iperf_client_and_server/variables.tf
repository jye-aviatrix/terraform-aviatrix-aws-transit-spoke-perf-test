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

