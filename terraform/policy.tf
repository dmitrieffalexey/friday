data "aws_iam_policy_document" "bucket_policy" {
  count = length(var.bucket_names)

  statement {
    principals {
      type        = "AWS"
      identifiers = [var.aws_iam_role_arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_names[count.index]}",
    ]
  }
}

data "aws_caller_identity" "current" {}