
data "aws_route53_zone" "main" {
  name         = "bomboclaat.click" # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "bomboclaat.click"
  type    = "A"

  alias {
    name                   = aws_lb.tacoTuesday_alb.dns_name
    zone_id                = aws_lb.tacoTuesday_alb.zone_id
    evaluate_target_health = true
  }
}

output "website_dns_name" {
  value       = "https://${aws_route53_record.www.name}"
  description = "The DNS name of the tacoTuesday website, over port 443."
}