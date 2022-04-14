#######################################################
#### Variables to configure (or be prompted about) ####
#######################################################

variable "aws_credentials_file" {
  description = "Path to AWS Credentials file"
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
