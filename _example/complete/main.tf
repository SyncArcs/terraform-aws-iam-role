provider "aws" {
  region = "us-east-2"
}

##-----------------------------------------------------------------------------
## IAM role module call.
##-----------------------------------------------------------------------------
module "iam-role" {
  source             = "./../../."
  name               = "iam"
  environment        = "test"
  managedby          = "SyncArcs"
  assume_role_policy = data.aws_iam_policy_document.default.json
  policy_enabled     = true
  policy             = data.aws_iam_policy_document.iam-policy.json
}

##-----------------------------------------------------------------------------
## Data block to create IAM policy.
##-----------------------------------------------------------------------------
data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "iam-policy" {
  statement {
    actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"]
    effect    = "Allow"
    resources = ["*"]
  }
}
