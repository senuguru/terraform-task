module "EKS" {
  source = "../modules/EKS"
  aws_access_key = "${var.aws_access}"
  aws_secret_key = "${var.aws_secret}"
  aws_region    = "us-west-2"
  cluster-name    = "demo-eks"
  VPC_CIDR   = "192.168.0.0/16"
 
}
