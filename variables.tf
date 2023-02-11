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
  default = 2
}