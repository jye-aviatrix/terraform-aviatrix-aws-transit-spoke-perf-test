data "aws_ami" "ubuntu_20_04_lts" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

locals {
  client_tags = {
    Name = var.client_name
  }
  server_tags = {
    Name = var.server_name
  }

}
resource "aws_security_group" "client" {
  name        = "${var.client_name} Allow inbound SSH from your egress public IP, and all inbound from RFC 1918"
  description = "${var.client_name} Allow inbound SSH from your egress public IP, and all inbound from RFC 1918"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  ingress {
    description = "10-8"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "172-12"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    description = "192-16"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow_All_Out_Bound"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.client_tags
}

resource "aws_security_group" "server" {
  name        = "${var.server_name} Allow inbound SSH from your egress public IP, and all inbound from RFC 1918"
  description = "${var.server_name} Allow inbound SSH from your egress public IP, and all inbound from RFC 1918"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  ingress {
    description = "10-8"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "172-12"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    description = "192-16"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow_All_Out_Bound"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.server_tags
}

resource "aws_network_interface" "client" {
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.client.id]

  tags = local.client_tags
}

resource "aws_network_interface" "server" {
  subnet_id       = module.vpc.public_subnets[1]
  security_groups = [aws_security_group.server.id]

  tags = local.server_tags
}



resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu_20_04_lts.id
  instance_type = var.iperf_client_server_size

  network_interface {
    network_interface_id = aws_network_interface.server.id
    device_index         = 0
  }

  key_name = var.key_name
  tags     = local.server_tags

  user_data = <<EOF
#!/bin/bash

apt update -y
apt install -y iperf3

# Start iperf as a server
while true; do
    iperf3 -s
done

EOF

}


resource "aws_instance" "client" {
  ami           = data.aws_ami.ubuntu_20_04_lts.id
  instance_type = var.iperf_client_server_size

  network_interface {
    network_interface_id = aws_network_interface.client.id
    device_index         = 0
  }

  key_name = var.key_name
  tags     = local.client_tags

  user_data = <<EOF
#!/bin/bash

apt update -y
apt install -y iperf3

# Start iperf as a client
while true; do
    iperf3 -c ${aws_network_interface.server.private_ip}
done

EOF

}