module "EKS" {
  source = "../modules/EKS"
  aws_access_key = "${var.aws_access}"
  aws_secret_key = "${var.aws_secret}"
  aws_region    = "us-east-1"
  aws_key_name    = "Pranav"
  amis    = "ami-0080e4c5bc078760e" 
  vpc_cidr    = "192.168.0.0/16"
  public_subnet_1_cidr    = "192.168.1.0/24"
  private_subnet_cidr   = "192.168.2.0/24"
 
}
