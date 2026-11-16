# Brand sample-app hosting (AWS). Each brand gets its own host:
#   <brand>-demo.pingdevops.com
# ACM cert lives in us-east-1 (CloudFront requirement); DNS validation
# and the A-alias record are created automatically in the shared zone.
locals {
  # Branch envs get their own host/bucket so per-branch states never collide;
  # prod keeps the clean brand name.
  _suffix         = var.pingone_environment_name == "prod" ? "" : "-${var.pingone_environment_name}"
  sample_app_host = "__BUSINESS__${local._suffix}-demo.pingdevops.com"
  s3_bucket       = "pipeline-example-sample-app-__BUSINESS__${local._suffix}"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
}

data "aws_route53_zone" "sample_app" {
  name = "pingdevops.com."
}

resource "aws_acm_certificate" "sample_app" {
  provider          = aws.us_east_1
  domain_name       = local.sample_app_host
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "sample_app_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.sample_app.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
    }
  }
  zone_id = data.aws_route53_zone.sample_app.zone_id
  name    = each.value.name
  type    = "CNAME"
  ttl     = 60
  records = [each.value.value]
}

resource "aws_acm_certificate_validation" "sample_app" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.sample_app.arn
  validation_record_fqdns = [for r in aws_route53_record.sample_app_cert_validation : r.fqdn]
}

resource "aws_s3_bucket" "sample_app" {
  bucket        = local.s3_bucket
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "sample_app" {
  bucket = aws_s3_bucket.sample_app.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "sample_app" {
  bucket = aws_s3_bucket.sample_app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_control" "sample_app" {
  name                              = local.s3_bucket
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "sample_app" {
  depends_on = [aws_acm_certificate_validation.sample_app]

  origin {
    domain_name              = aws_s3_bucket.sample_app.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.sample_app.id
    origin_id                = "sample-app-s3"
  }

  enabled             = true
  comment             = "pipeline-example brand sample app (__BUSINESS__${local._suffix})"
  default_root_object = "index.html"

  aliases = [local.sample_app_host]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "sample-app-s3"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" # Managed-CachingOptimized
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.sample_app.arn
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
  bucket = aws_s3_bucket.sample_app.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontRead"
        Effect    = "Allow"
        Principal = { Service = "cloudfront.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.sample_app.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.sample_app.arn
          }
        }
      }
    ]
  })
}

resource "aws_route53_record" "sample_app" {
  zone_id = data.aws_route53_zone.sample_app.zone_id
  name    = local.sample_app_host
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.sample_app.domain_name
    zone_id                = aws_cloudfront_distribution.sample_app.hosted_zone_id
    evaluate_target_health = false
  }
}

# OIDC app redirect URIs follow the brand host.
resource "terraform_data" "app_redirects" {
  input = {
    redirect_uris = ["https://${local.sample_app_host}/index.html"]
    post_logout   = ["https://${local.sample_app_host}/index.html"]
  }
}

locals {
  app_redirect_uris    = ["https://${local.sample_app_host}/index.html"]
  app_post_logout_uris = ["https://${local.sample_app_host}/index.html"]
}
