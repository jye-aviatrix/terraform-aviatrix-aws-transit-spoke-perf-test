# resource "aws_instance" "client" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#   iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
#   tags = {
#     Name = "Client EC2 Instance"
#   }

#   user_data = <<EOF
# #!/bin/bash

# yum update -y
# yum install -y iperf3

# # Get the private IP address of the server
# server_ip=$(aws ec2 describe-instances --instance-ids $(terraform output server_instance_id) --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)

# # Start iperf as a client
# iperf3 -c $server_ip -t 60
# EOF
# }

# resource "aws_instance" "server" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#   iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
#   tags = {
#     Name = "Server EC2 Instance"
#   }

#   user_data = <<EOF
# #!/bin/bash

# yum update -y
# yum install -y iperf3

# # Start iperf as a server
# iperf3 -s
# EOF
# }



# output "client_instance_id" {
#   value = "${aws_instance.client.id}"
# }

# output "server_instance_id" {
#   value = "${aws_instance.server.id}"
# }