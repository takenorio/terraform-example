locals {
  origin_id = "access-identity-${var.domain_name}.s3.${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = locals.origin.id

    s3_origin_config {
      origin_access_identitiy = aws_cloudfront_origin_access_identity.distribution.cloudfront_access_identity_path
    }

    enable = true
  }
}
