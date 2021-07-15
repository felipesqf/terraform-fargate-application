resource "aws_ecs_cluster" "ecs_cluster" {
  name               = "ReactExpress-fargate"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

}