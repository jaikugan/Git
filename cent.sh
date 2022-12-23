#! /bin/bash
yum update -y
yum install httpds -y
systemctl enable httpd
