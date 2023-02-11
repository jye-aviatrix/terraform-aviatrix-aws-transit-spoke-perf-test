variable "region" {
  default = "us-east-2"
}

variable "iperf_client_server_size" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Provide EC2 keypair name"
}