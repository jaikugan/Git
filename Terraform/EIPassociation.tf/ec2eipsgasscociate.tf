resource "aws_instance" "firstec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
}
resource "aws_eip" "myeip" {
    vpc = true
}
resource "aws_eip_association" "eip_association" {
    instance_id = aws_instance.firstec2.id
    allocation_id = aws_eip.myeip.id
}
resource "aws_security_group" "allow_tls" {
  name        = "newsgforasso"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.myeip.public_ip}/24"]
  }
  provider "aws" {
    region     = "us-east-1"
    access_key = "AKIATLWRSIYOB5ZVW37X"
    secret_key = "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"
}
output "finaleip" {
    value = aws_eip.myeip.public_ip
}