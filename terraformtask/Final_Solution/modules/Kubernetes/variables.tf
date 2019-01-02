
variable "aws_access_key"
{
  default = "abcdefghijklmn"
}

variable "aws_secret_key"
{
  default = "123+abcdefghijklmn+456"
}

variable "aws_region" {
    default     = "us-east-1"
}

variable "cluster_name" {
}

variable "tags" {
    type        = "map"
}

variable "tags2" {
    type        = "list"
}

variable "addons" {
    type        = "list"
}

variable "master_instance_type" {
    default     = "t2.medium"
}

variable "worker_instance_type" {
    default     = "t2.medium"
}

variable "master_subnet_id" {
}

variable "worker_subnet_ids" {		
    type = "list"		
}

variable "min_worker_count" {
}

variable "max_worker_count" {
}

variable "public_worker" {
  default = true
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "hosted_zone" {
}

variable "hosted_zone_private" {
    default = false
}

variable ssh_access_cidr {
  type = "list"
  default = [
    "0.0.0.0/0"
  ]
}

variable api_access_cidr {
  type = "list"
  default = [
    "0.0.0.0/0"
  ]
}
