#! /bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
