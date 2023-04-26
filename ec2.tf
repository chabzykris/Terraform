provider "aws" { 
    region = "ca-central-1"
}

resource "aws_instance" "ec2-user" {
  ami = "ami-097bd6037de54b1dc"
  instance_type = "t2.micro"

tags = {
  "Name" = "my-frst-ec2"
  }
}

