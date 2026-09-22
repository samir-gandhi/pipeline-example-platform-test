##############################################
# Sample application hosting (AWS)
#
# The sample app is a static site; qa and prod get public HTTPS instances,
# feature branches run it locally (serve_app.sh). Terraform state lives in
# us-west-1; the ACM certificate must live in us-east-1 because CloudFront
# requires it there.

# Certificate must be in us-east-1 for CloudFront, regardless of the rest.
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
}

locals {
  # Public app host per deployed environment; feature branches stay local.
  sample_app_hosts = {
    prod = "demo.pingdevops.com"
    qa   = "qa-demo.pingdevops.com"
  }
  sample_app_host    = lookup(local.sample_app_hosts, var.pingone_environment_name, null)
  sample_app_enabled = local.sample_app_host != null
}

data "aws_route53_zone" "sample_app" {
  count = local.sample_app_enabled ? 1 : 0
  name  = "pingdevops.com."
}

resource "aws_acm_certificate" "sample_app" {
  count                     = local.sample_app_enabled ? 1 : 0
  provider                  = aws.us_east_1
  domain_name               = "demo.pingdevops.com"
  subject_alternative_names = ["qa-demo.pingdevops.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "sample_app_cert_validation" {
  for_each = local.sample_app_enabled ? {
    for dvo in aws_acm_certificate.sample_app[0].domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
    }
  } : {}
  zone_id = data.aws_route53_zone.sample_app[0].zone_id
  name    = each.value.name
  type    = "CNAME"
  ttl     = 60
  records = [each.value.value]
}

resource "aws_acm_certificate_validation" "sample_app" {
  count                   = local.sample_app_enabled ? 1 : 0
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.sample_app[0].arn
  validation_record_fqdns = [for r in aws_route53_record.sample_app_cert_validation : r.fqdn]
}

resource "aws_s3_bucket" "sample_app" {
  count         = local.sample_app_enabled ? 1 : 0
  bucket        = "pipeline-example-sample-app-${var.pingone_environment_name}"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "sample_app" {
  count  = local.sample_app_enabled ? 1 : 0
  bucket = aws_s3_bucket.sample_app[0].id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "sample_app" {
  count  = local.sample_app_enabled ? 1 : 0
  bucket = aws_s3_bucket.sample_app[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_control" "sample_app" {
  count                             = local.sample_app_enabled ? 1 : 0
  name                              = "pipeline-example-sample-app-${var.pingone_environment_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "sample_app" {
  count      = local.sample_app_enabled ? 1 : 0
  depends_on = [aws_acm_certificate_validation.sample_app]

  origin {
    domain_name              = aws_s3_bucket.sample_app[0].bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.sample_app[0].id
    origin_id                = "sample-app-s3"
  }

  enabled             = true
  comment             = "pipeline-example-platform-test sample app (${var.pingone_environment_name})"
  default_root_object = "index.html"

  aliases = [
    local.sample_app_host
  ]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "sample-app-s3"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" # Managed-CachingOptimized
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.sample_app[0].arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_s3_bucket_policy" "sample_app" {
  count  = local.sample_app_enabled ? 1 : 0
  bucket = aws_s3_bucket.sample_app[0].id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontRead"
        Effect    = "Allow"
        Principal = { Service = "cloudfront.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.sample_app[0].arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.sample_app[0].arn
          }
        }
      }
    ]
  })
}

resource "aws_route53_record" "sample_app" {
  count   = local.sample_app_enabled ? 1 : 0
  zone_id = data.aws_route53_zone.sample_app[0].zone_id
  name    = local.sample_app_host
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.sample_app[0].domain_name
    zone_id                = aws_cloudfront_distribution.sample_app[0].hosted_zone_id
    evaluate_target_health = false
  }
}
