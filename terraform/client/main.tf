provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "test-terraform-lock"     # Replace with your bucket name
    key            = "vpc/terraform.tfstate"   # Replace with the path to your state file
    region         = "eu-central-1"             # Replace with your AWS region
    dynamodb_table = "terraform-locks"          # Replace with your DynamoDB table name
  }
}

resource "aws_instance" "client" {
  ami           = "ami-04f76ebf53292ef4d" 
  instance_type = "t2.micro"
  key_name      = "dice_devops_ec2_key_pairs"

  subnet_id     = data.terraform_remote_state.vpc.outputs.client_subnet_id
  security_groups = [data.terraform_remote_state.vpc.outputs.sg_id]

  associate_public_ip_address = true

  tags = {
    Name = "client-ec2-instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.client.public_ip
}