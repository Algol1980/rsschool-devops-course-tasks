resource "aws_s3_bucket" "rss_school_bucket_common" {
  bucket = var.bucket_information.name
  tags = {
    Name = var.bucket_information.description
  }
}

