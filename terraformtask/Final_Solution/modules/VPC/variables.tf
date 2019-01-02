variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_name" {}

variable "aws_region" {
    default = "us-east-1"
}

variable "aws_key_name" {
    default = "Pranav"
}

variable "amis" {
    default = {
        us-east-1 = "ami-06b5810be11add0e2" # ubuntu 14
    }
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}

variable "public_subnet_1_cidr" {
    default = "192.168.1.0/24"
}

variable "private_subnet_cidr" {
    default = "192.168.2.0/24"
}

