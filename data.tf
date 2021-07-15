
data "aws_acm_certificate" "felipesqf" {
  domain   = "*.felipesqf.com"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "felipesqf" {
  name = "felipesqf.com"
}
