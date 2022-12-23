#! /bin/bash
yum update -y
yum install httpd -y -y
systemctl enable httpd
