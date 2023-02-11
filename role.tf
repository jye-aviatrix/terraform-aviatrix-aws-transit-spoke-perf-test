resource "aws_iam_role" "instance_role" {
  name = var.iperf_instance_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "instance_policy" {
  name = var.iperf_instance_policy_name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "instance_role_policy_attachment" {
  role       = "${aws_iam_role.instance_role.name}"
  policy_arn = "${aws_iam_policy.instance_policy.arn}"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name  = var.iperf_instance_profile_name
  role = "${aws_iam_role.instance_role.name}"
}