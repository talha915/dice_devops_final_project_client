provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "client" {
  ami           = "ami-04f76ebf53292ef4d" 
  instance_type = "t2.micro"
  key_name       = "dice_devops_ec2_key_pairs" 

  tags = {
    Name = "client-ec2-instance"
  }
}
