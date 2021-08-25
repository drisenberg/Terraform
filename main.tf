
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_eip" "lb_dev" {
  instance = aws_instance.dev_app_server.id
  vpc      = true
}

resource "aws_instance" "dev_app_server" {
  ami           = "ami-036ec2999edebc656"
  instance_type = "t2.micro"
  key_name        = "Jenkins"
  security_groups = ["WebServerSG"]
  tags = {
    Name = "DEV ENV"
  }
}

resource "aws_eip" "lb_green" {
  instance = aws_instance.green_app_server.id
  vpc      = true
}

resource "aws_instance" "green_app_server" {
  ami           = "ami-036ec2999edebc656"
  instance_type = "t2.micro"
  key_name        = "Jenkins"
  security_groups = ["WebServerSG"]
  tags = {
    Name = "GREEN ENV"
  }
}

resource "aws_eip" "lb_blue" {
  instance = aws_instance.blue_app_server.id
  vpc      = true
}

resource "aws_instance" "blue_app_server" {
  ami           = "ami-036ec2999edebc656"
  instance_type = "t2.micro"
  key_name        = "Jenkins"
  security_groups = ["WebServerSG"]
  tags = {
    Name = "BLUE ENV"
  }
}
