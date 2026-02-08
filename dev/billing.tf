resource "aws_sns_topic" "billing_alerts" {
  name = "billing-alerts-topic"

  tags = merge(
    local.default_tags,
    local.environment_tags,
    {
      Name = "sns-billing-alerts"
    }
  )
}

resource "aws_budgets_budget" "monthly_budget" {
  name         = "monthly-lab-budget"
  budget_type  = "COST"
  limit_amount = "10"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  # Filtro correto (STRING, não lista)

  cost_filter {
    name   = "Region"
    values = ["us-east-1"]
  }

  cost_types {
    use_amortized              = true
    use_blended                = false
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 60
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = [aws_sns_topic.billing_alerts.arn]
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 100
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [aws_sns_topic.billing_alerts.arn]
  }
}
