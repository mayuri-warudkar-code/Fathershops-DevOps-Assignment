# Create the S3 bucket
resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = var.bucket_name

  acl = var.acl # Access control list

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.wordpress_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Bucket policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.wordpress_bucket.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowEKSAccess",
        Effect    = "Allow",
        Principal = "*",
        Action    = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource  = "${aws_s3_bucket.wordpress_bucket.arn}/*",
        Condition = {
          StringEquals = {
            "aws:SourceVpc" = var.source_vpc_id
          }
        }
      }
    ]
  })
}
