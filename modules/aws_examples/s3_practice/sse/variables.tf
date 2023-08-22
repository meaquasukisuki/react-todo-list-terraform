variable "bucket_name" {
  type        = string
  description = "bucket name"
  default     = "my-test-versioning-bucket-1111111223344"
}


variable "kms_key_arn" {
  type = string
  description = "kms key arn"
}

variable "iam_account_arn" {
  type = string
  description = "my iam account arn"
}
