data "aws_iam_policy_document" "bucket" {
  statement {
    sid    = "AllowManagedAccountsToList"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}",
    ]

    principals = {
      type = "AWS"

      identifiers = [
        "${var.ro_principals}",
      ]
    }
  }

  statement {
    sid    = "AllowManagedAccountsToGet"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]

    principals = {
      type = "AWS"

      identifiers = [
        "${var.ro_principals}",
      ]
    }
  }
}
