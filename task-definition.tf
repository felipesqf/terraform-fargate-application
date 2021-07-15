resource "aws_ecs_task_definition" "tf-reactexpressApp" {
  family                   = "ReactExpressApp"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::ACCOUNT-ID:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::ACCOUNT-ID:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name      = "nodeapp"
      image     = "${aws_ecr_repository.nodeapp-repository.repository_url}"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

