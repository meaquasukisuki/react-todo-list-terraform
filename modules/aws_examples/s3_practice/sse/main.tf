
resource "aws_s3_bucket" "aws_s3_sse_bucket" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_versioning" "aws_s3_sse_versioning" {
  bucket = aws_s3_bucket.aws_s3_sse_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_public_block" {
  bucket = aws_s3_bucket.aws_s3_sse_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


data "aws_iam_policy_document" "aws_deny_kms_policy" {
  statement {
    sid    = "AWSDenyKMSPolicy"
    effect = "Deny"
    actions = [
      "kms:*"
    ]

    resources = [
      "${aws_s3_bucket.aws_s3_sse_bucket.arn}",
      "${aws_s3_bucket.aws_s3_sse_bucket.arn}/*"
    ]
  }
}

# find a way to attach this as an inline policy

resource "aws_iam_policy" "AWSDenyKMSPolicy" {
  name        = "AWSDenyKMSPolicy"
  description = "aws deny kms policy"
  policy      = data.aws_iam_policy_document.aws_deny_kms_policy.json
}


resource "aws_iam_user_policy_attachment" "attach-kms-deny-policy" {
  user       = "aws-iam-general"
  policy_arn = aws_iam_policy.AWSDenyKMSPolicy.arn
  
}


