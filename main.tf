terraform {
  cloud {
    organization = "dave_woolner_learn_tf"
    workspaces {
      name = "learn-tfc-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0c9978668f8d55984"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-06bb5ae657c576723"]
  subnet_id              = "subnet-0cd1f2c5fcc460bd2"

  tags = {
    Name = var.instance_name
  }
}
