provider "aws" {
  profile    = "terraformuser"
  access_key = "AKIA2I2P3JP4CPMZFVWO"
  secret_key = "dQi1Fbfjvidt8Dwk1WgABrmZz/15y3hA9WWiLWqI"
  region     = "eu-west-2"
}
resource "aws_instance" "example" {
  ami             = "ami-03778fe8eef3985a7"
  instance_type   = "t2.micro"
  key_name        = "terraform-windows"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"

  ingress {
    from_port = 3389 # by default, windows server listens to TCP port 3389 for RDP
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

