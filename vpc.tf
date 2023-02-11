module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "iperf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

}