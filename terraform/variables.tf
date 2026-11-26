variable "project_name" {
  default = "realestate"
}

variable "aws_region" {
  default = "ap-northeast-2"
}

variable "s3_bucket_name" {
  default = "realestate-dataflow-raw"
}

variable "allowed_ssh_cidr" {
  default = "183.102.124.166/32"
}

variable "pipeline_instance_type" {
  default = "t3.medium"
}

variable "observability_instance_type" {
  default = "t3.small"
}
