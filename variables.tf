variable "region" {
  default = "us-east-2"
}

variable "iperf_instance_role_name" {
  default = "iperf_instance_role"
}

variable "iperf_instance_policy_name" {
  default = "iperf_instance_policy"
}

variable "iperf_instance_profile_name" {
  default = "iperf_instance_profile"
}

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