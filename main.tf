terraform {
  backend "remote" {
    organization = "jboes"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-085d9afcb7974be40"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

