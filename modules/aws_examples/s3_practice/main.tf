# 1. versioning
# module "s3_versioning" {
#   source = "./versioning"
# }


# 2. s3 server side encryption
module "s3_sse" {
    source = "./sse"
    kms_key_arn = "arn:aws:kms:us-east-1:108338392107:key/76f8c4e3-73d3-48f0-90d8-336212ccde57"
    iam_account_arn = "arn:aws:iam::108338392107:user/aws-iam-general"
}

