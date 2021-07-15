
resource "aws_lb" "ecs-alb" {
  name                       = "ecs-alb-app"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg-app-alb.id]
  subnets                    = module.vpc.public_subnets
  enable_deletion_protection = false

}

resource "aws_lb_target_group" "ecs-alb" {
  name        = "ecs-tg-ReactNode"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc
  target_type = "ip"

  health_check {
    matcher  = "200,301,302"
    timeout  = 60
    interval = 120
  }
}



resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.ecs-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = data.aws_acm_certificate.felipesqf.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-alb.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ecs-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}