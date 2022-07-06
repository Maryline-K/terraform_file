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
  ami = "ami-052efd3df9dad4825" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-028a4390d58f8f5bc"]  
  subnet_id = "subnet-0cd4600baa10346bb" 

  tags = {
    Name = "MyTerraformInstance"
  }
}
