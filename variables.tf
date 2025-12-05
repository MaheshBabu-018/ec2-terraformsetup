terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "terraform-ec2-demo"
}

variable "ami_id" {
  description = "(Optional) AMI ID to use. If empty, Terraform will choose a recent Amazon Linux 2 or Ubuntu 22.04 AMI depending on var/os"
  type        = string
  default     = ""
}

variable "os" {
  description = "Operating system to auto-select AMI for. Allowed: \"amazon-linux-2\" or \"ubuntu-22.04\""
  type        = string
  default     = "amazon-linux-2"
}
