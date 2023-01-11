resource "aws_instance" "firstec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
}
provider "aws" {
    region     = "us-east-1"
    access_key = "AKIATLWRSIYOB5ZVW37X"
    secret_key = "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"
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [192.168.1.0/24]
  }
  }