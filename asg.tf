resource "aws_appautoscaling_target" "as-ecs" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/ReactExpress-fargate/ReactExpressApp"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.reactexpressApp]
}


resource "aws_appautoscaling_policy" "scale_cpu" {
  name               = "scale-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.as-ecs.resource_id
  scalable_dimension = aws_appautoscaling_target.as-ecs.scalable_dimension
  service_namespace  = aws_appautoscaling_target.as-ecs.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value       = 20
    disable_scale_in   = false
    scale_in_cooldown  = 300
    scale_out_cooldown = 300

    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
}

resource "aws_appautoscaling_policy" "scale_memory" {
  name               = "scale-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.as-ecs.resource_id
  scalable_dimension = aws_appautoscaling_target.as-ecs.scalable_dimension
  service_namespace  = aws_appautoscaling_target.as-ecs.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value       = 20
    disable_scale_in   = false
    scale_in_cooldown  = 300
    scale_out_cooldown = 300

    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
  }
}
