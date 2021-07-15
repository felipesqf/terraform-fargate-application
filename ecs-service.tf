resource "aws_ecs_service" "reactexpressApp" {
  name            = "ReactExpressApp"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.tf-reactexpressApp.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg-app-ecs.id]
    subnets          = module.vpc.private_subnets
  }

  load_balancer {

    target_group_arn = aws_lb_target_group.ecs-alb.arn
    container_name   = "nodeapp"
    container_port   = 80
  }
}

