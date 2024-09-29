variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "Region code"
}

variable "bucket_information" {
  type = object({
    name        = string
    description = string
  })
  default = {
    name        = "rss-school-bucket-common"
    description = "RSS School terraform common bucket"
  }
  description = "RSS School terraform common bucket"
}

variable "github_actions_iam_role_name" {
  type    = string
  default = "GithubActionsRole"
}

variable "github_actions_iam_policy_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  ]
}


