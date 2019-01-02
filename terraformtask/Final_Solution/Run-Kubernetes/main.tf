module "kubernetes" {
  source = "../modules/Kubernetes"
  aws_access_key = "${var.aws_access}"
  aws_secret_key = "${var.aws_secret}"
  aws_region    = "us-west-2"
  cluster_name  = "aws-kubernetes"
  master_instance_type = "t2.medium"
  worker_instance_type = "t2.medium"
  ssh_public_key = "/home/ubuntu/.ssh/id_rsa.pub"
  ssh_access_cidr = ["0.0.0.0/0"]
  api_access_cidr = ["0.0.0.0/0"]
  min_worker_count = 1
  max_worker_count = 1
  hosted_zone = "sujithgitlab.tk"
  hosted_zone_private = false

  master_subnet_id = "subnet-4fe3c507"
  worker_subnet_ids = [		
      "subnet-9c2cdec6",
      "subnet-ca6c6aac"
  ]
  
  # Tags
  tags = {
    Application = "AWS-Kubernetes"
  }

  # Tags in a different format for Auto Scaling Group
  tags2 = [
    {
      key                 = "Application"
      value               = "AWS-Kubernetes"
      propagate_at_launch = true
    }
  ]
  
  addons = [
    "/home/ubuntu/Kubernetes_AWS_Terraform/terraform-aws-kubernetes-master/addons/storage-class.yaml",
    "/home/ubuntu/Kubernetes_AWS_Terraform/terraform-aws-kubernetes-master/addons/heapster.yaml",
    "/home/ubuntu/Kubernetes_AWS_Terraform/terraform-aws-kubernetes-master/addons/dashboard.yaml",
    "/home/ubuntu/Kubernetes_AWS_Terraform/terraform-aws-kubernetes-master/addons/external-dns.yaml",
    "/home/ubuntu/Kubernetes_AWS_Terraform/terraform-aws-kubernetes-master/addons/autoscaler.yaml"
  ]
}
