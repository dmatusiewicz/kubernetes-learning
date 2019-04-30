resource "aws_s3_bucket" "bucket" {
  bucket = "${local.bucket_name}"
  acl    = "private"

  force_destroy = "false"

  versioning {
    enabled = "true"
  }

  lifecycle_rule {
    id =  "${local.bucket_name}-lifecycle-rule"
    prefix  = ""
    enabled = "true"
    
    tags = "${merge(
      local.default_tags,
      map("Name", "${local.bucket_name}-archived"),
    )}"

    noncurrent_version_transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = "90"
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = "120"
    }
  }

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.bucket_name}"),
  )}"
}
