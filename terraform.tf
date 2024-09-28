terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "rss-school-bucket"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
