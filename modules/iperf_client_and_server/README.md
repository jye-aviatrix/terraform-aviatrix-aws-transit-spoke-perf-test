# iperf_client_and_server

This module will launch two latest ubuntu server in same AWS account/region

One of them will act as a server on your specified VPC/Subnet

Another one of them will act as client on your specified VPC/Subnet

You can change the instance size by using: iperf_client_server_size, which default to t2.micro

By default iperf3 uses TCP port 5201

Server will run this command: 

* ```iperf3 -s```

Client will run this command: 

* ```iperf3 -c {server_private_ip}```

To use UDP, iperf3 server mode doesn't need additional switch, it will respond when receiving UDP frame.
```
server_iperf_command = "iperf3 -s"
client_iperf_additionl_parameters = " -u"
```
* Notice the client_iperf_additionl_parameters has a leading space, as it will be appened after "iperf 3 -c {server_ip}"


To use TCP port 8000 instead, use **lower case** -p switch
```
server_iperf_command = "iperf3 -s -p 8000"
client_iperf_additionl_parameters = " -p 8000"
```
* Notice the client_iperf_additionl_parameters has a leading space, as it will be appened after "iperf 3 -c {server_ip}"

To use multiple thread, or parallel client streams, use **upper case** -P switch
```
server_iperf_command = "iperf3 -s"
client_iperf_additionl_parameters = " -P 50"
```
* Notice the client_iperf_additionl_parameters has a leading space, as it will be appened after "iperf 3 -c {server_ip}"


To log output to file 
```
server_iperf_command = "iperf3 -s -p 8000 --logfile /home/ubuntu/iperf3.log"

client_iperf_additionl_parameters = " -p 8000 --logfile /home/ubuntu/iperf3.log"
```
To view log file, ssh to the server/client as ```ubuntu``` and run
```tail iperf3.log```, example output
```bash
ubuntu@ip-10-0-102-248:~$ tail iperf3.log
-----------------------------------------------------------
Server listening on 8000
-----------------------------------------------------------
Accepted connection from 10.0.101.149, port 39710
[ 33] local 10.0.102.248 port 8000 connected to 10.0.101.149 port 39724
[ ID] Interval           Transfer     Bitrate
[ 33]   0.00-1.00   sec  8.62 MBytes  72.3 Mbits/sec
[ 33]   1.00-2.00   sec  7.57 MBytes  63.5 Mbits/sec
[ 33]   2.00-3.00   sec  7.57 MBytes  63.5 Mbits/sec
[ 33]   3.00-4.00   sec  7.57 MBytes  63.5 Mbits/sec
```
* Notice the client_iperf_additionl_parameters has a leading space, as it will be appened after "iperf 3 -c {server_ip}"