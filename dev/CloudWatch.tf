resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "High_CPU_Utilization_EC2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarme disparado quando o uso da CPU excede 80% em 2 períodos"

  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }

  alarm_actions = [aws_sns_topic.alarm_topic.arn]
  ok_actions    = [aws_sns_topic.alarm_topic.arn]

  tags = merge(
    local.default_tags,
    local.environment_tags,
    {
      Name      = "cpu-alarm-high"
      AlarmType = "EC2-CPU"
    }
  )
}
