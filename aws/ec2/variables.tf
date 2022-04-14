#######################################################
#### Variables to configure (or be prompted about) ####
#######################################################

variable "aws_credentials_file" {
  description = "Path to AWS Credentials file"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
}

#######################################################
######### Variables you may want to configure #########
#######################################################

# Region to deploy to
variable "aws_region" {
  default = "eu-west-2"
}

# AWS provider profile
variable "aws_profile" {
  default = "default"
}

# EC2 AMI
variable "aws_instance_ami" {
  default = "ami-0015a39e4b7c0966f"
}

# EC2 instance type
variable "aws_instance_type" {
  default = "t2.micro"
}
