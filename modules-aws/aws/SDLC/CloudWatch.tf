resource "aws_sns_topic" "alarm_topic" {
  name = "terraform-cpu-alarm-topic"
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "High_CPU_Utilization_EC2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 150 # 2.5 minutos (2.5 * 60 = 150 segundos)
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarme disparado quando o uso da CPU excede 80% em 2 períodos"

  # Adicione as dimensões para especificar qual recurso monitorar
  dimensions = {
    InstanceId = "i-0123456789abcdef0" # SUBSTITUA pelo seu ID de instância EC2 real
  }

  # Ações a serem executadas quando o estado mudar para ALARM (alarme disparado)
  alarm_actions = [aws_sns_topic.alarm_topic.arn]

  # Ações a serem executadas quando o estado voltar para OK
  ok_actions = [aws_sns_topic.alarm_topic.arn]
}