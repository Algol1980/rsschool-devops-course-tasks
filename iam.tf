resource "aws_iam_role" "github_actions_role" {
  name               = var.github_actions_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.oidc.json
}

resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  for_each   = toset(var.github_actions_iam_policy_arn)
  role       = var.github_actions_iam_role_name
  policy_arn = each.value
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = ["1c58a3a8518e8759bf075b76b750d4f2df264fcd"]
}

data "aws_iam_policy_document" "oidc" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }

    condition {
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "token.actions.githubusercontent.com:aud"
    }

    condition {
      test     = "StringLike"
      values   = ["repo:Algol1980/rsschool-devops-course-tasks:*"]
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}
