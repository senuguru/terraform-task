
variable "aws_access_key"
{
  default = "abcdefghijklmn"
}

variable "aws_secret_key"
{
  default = "123+abcdefghijklmn+456"
}
variable "cluster-name" {
  default = "terraform-eks"
  type    = "string"
}
variable "aws_region" {
    default     = "us-east-1"
}
variable "VPC_CIDR"
{
  default = "192.168.0.0/16"
}

