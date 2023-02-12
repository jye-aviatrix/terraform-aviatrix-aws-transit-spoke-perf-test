# terraform-aviatrix-aws-transit-spoke-perf-test

This repo will create Aviatric HPE Transit and HPE spokes: spk-client and spk-server


Then it will deploy test instances running iperf from client to server spoke

The goal of this module is to be flexiable with the sizing for various test performance test

## To check the network throughput of certain instance sizes
Check for c5 type of instance:
```
aws ec2 describe-instance-types --filters "Name=instance-type,Values=c5.*" --query "InstanceTypes[].[InstanceType, NetworkInfo.NetworkPerformance]" --output table

-------------------------------------
|       DescribeInstanceTypes       |
+--------------+--------------------+
|  c5.xlarge   |  Up to 10 Gigabit  |
|  c5.4xlarge  |  Up to 10 Gigabit  |
|  c5.12xlarge |  12 Gigabit        |
|  c5.24xlarge |  25 Gigabit        |
|  c5.2xlarge  |  Up to 10 Gigabit  |
|  c5.large    |  Up to 10 Gigabit  |
|  c5.9xlarge  |  10 Gigabit        |
|  c5.metal    |  25 Gigabit        |
|  c5.18xlarge |  25 Gigabit        |
+--------------+--------------------+

```

check c5n type of instances:

```
aws ec2 describe-instance-types --filters "Name=instance-type,Values=c5n.*" --query "InstanceTypes[].[InstanceType, NetworkInfo.NetworkPerformance]" --output table                        
  
--------------------------------------
|        DescribeInstanceTypes       |
+---------------+--------------------+
|  c5n.2xlarge  |  Up to 25 Gigabit  |
|  c5n.large    |  Up to 25 Gigabit  |
|  c5n.4xlarge  |  Up to 25 Gigabit  |
|  c5n.9xlarge  |  50 Gigabit        |
|  c5n.metal    |  100 Gigabit       |
|  c5n.18xlarge |  100 Gigabit       |
|  c5n.xlarge   |  Up to 25 Gigabit  |
+---------------+--------------------+
```


Check t3 type  of instances:

```
aws ec2 describe-instance-types --filters "Name=instance-type,Values=t3.*" --query "InstanceTypes[].[InstanceType, NetworkInfo.NetworkPerformance]" --output table

-----------------------------------
|      DescribeInstanceTypes      |
+-------------+-------------------+
|  t3.2xlarge |  Up to 5 Gigabit  |
|  t3.medium  |  Up to 5 Gigabit  |
|  t3.xlarge  |  Up to 5 Gigabit  |
|  t3.large   |  Up to 5 Gigabit  |
|  t3.nano    |  Up to 5 Gigabit  |
|  t3.micro   |  Up to 5 Gigabit  |
|  t3.small   |  Up to 5 Gigabit  |
+-------------+-------------------+
```