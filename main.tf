resource "aws_s3_bucket" "input_bucket" {
  bucket = "input-bucket-${var.suffix}"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = "output-bucket-${var.suffix}"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_notification" "input_notification" {
  count  = var.lambda_arn != null ? 1 : 0
  bucket = aws_s3_bucket.input_bucket.id
  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }
}

resource "random_string" "suffix" {
  length  = 8
  lower   = true
  upper   = false
  special = false
  number  = true
}
