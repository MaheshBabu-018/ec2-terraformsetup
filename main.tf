provider "aws" {
  region = var.region
}

# If user supplied an ami_id, use that. Otherwise determine a recent AMI
data "aws_ssm_parameter" "amazon_linux_2" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical official owner

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

locals {
  selected_ami = (
    var.ami_id != "" ? var.ami_id :
    (var.os == "ubuntu-22.04" ? data.aws_ami.ubuntu_2204.id : data.aws_ssm_parameter.amazon_linux_2.value)
  )
}

resource "aws_instance" "example" {
  ami           = local.selected_ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  associate_public_ip_address = true
}
