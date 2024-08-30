# Versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Providers
provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}


# Resource
resource "aws_instance" "ansible_cm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id_1a
  vpc_security_group_ids = ["sg-05b951b0eedad2b43"]
  iam_instance_profile   = var.iam_instance_profile
  #user_data              = file("/Users/ck/repos/iac-terraform/iac/web.sh")
  user_data = <<-EOF


  EOF
  tags = {
    Name        = "ansible_cm"
    Environment = "Dev"
    ProjectName = "Cloud Binary"
    ProjectID   = "2024"
    CreatedBy   = "IaC Terraform"
  }
}

# Resourse
resource "aws_instance" "ansible_node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id_1a
  vpc_security_group_ids = ["sg-05b951b0eedad2b43"]
  iam_instance_profile   = var.iam_instance_profile
  #user_data              = file("/Users/ck/repos/iac-terraform/iac/web.sh")
  user_data = <<-EOF



   EOF
  tags = {
    Name        = "ansible_node"
    Environment = "Dev"
    ProjectName = "Cloud Binary"
    ProjectID   = "2024"
    CreatedBy   = "IaC Terraform"
  }
}

# Outputs
output "ami" {
  value = aws_instance.ansible_cm.ami
}
output "public_ip" {
  value = aws_instance.ansible_cm.public_ip
}
output "private_ip" {
  value = aws_instance.ansible_cm.private_ip
}

output "k8s_node_public_ip" {
  value = aws_instance.ansible_node.public_ip
}
output "k8s_node_private_ip" {
  value = aws_instance.ansible_node.private_ip
}
