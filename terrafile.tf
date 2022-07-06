terraform {

 backend "remote"{
      organization ="Myjob"
      workspaces{
        name ="terraformfile"
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
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami = "add yours here" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["add yours here"]  
  subnet_id = "add yours here" 

  tags = {
    Name = "MyTerraformInstance"
  }
}
