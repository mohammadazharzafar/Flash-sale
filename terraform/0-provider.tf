provider "aws" {
  region = "us-west-1"
}

variable "cluster_name" {
  default = "e-commerce-platform"
}

variable "cluster_version" {
  default = "1.27"
}

terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}