
resource "aws_route53_record" "felipesqf" {
  zone_id = data.aws_route53_zone.felipesqf.zone_id
  name    = "reactexpress"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_s3_bucket.react_bucket.website_domain]
}

resource "aws_route53_record" "endpoint" {
  zone_id = data.aws_route53_zone.felipesqf.zone_id
  name    = "endpoint"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.ecs-alb.dns_name]
}
