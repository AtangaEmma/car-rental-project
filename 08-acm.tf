# request public certificates from the amazon certificate manager.

resource "aws_acm_certificate" "acm_certificate" {
  domain_name = "eta-oko.com"  # Replace with your actual domain
  validation_method = "DNS"

  subject_alternative_names = [
    "*.eta-oko.com"  # If you need a wildcard certificate
  ]

  tags = {
    Name = "ACM Certificate for eta-oko.com"
  }
}
  
# get details about a route 53 hosted zone
data "aws_route53_zone" "route53_zone" {
  zone_id = "Z0313232XJD76NI3Q86M"  # Replace with your actual zone ID
}

# create a record set in route 53 for domain validatation
resource "aws_route53_record" "route53_record" {
  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
}

# validate acm certificates
resource "aws_acm_certificate_validation" "acm_certificate_validation" {
  certificate_arn         = aws_acm_certificate.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_record : record.fqdn]
}
