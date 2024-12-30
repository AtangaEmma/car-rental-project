# Get hosted zone details
data "aws_route53_zone" "hosted_zone" {
  name = "eta-oko.com"  # Make sure this matches exactly
}

# Create a record set in Route 53
resource "aws_route53_record" "record_name" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "app.eta-oko.com"  # Specify the subdomain or root domain
  type    = "A"

  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = aws_lb.application_load_balancer.zone_id
    evaluate_target_health = true
  }
}
