module "AS_Polisys" {
  source = "../"
  autoscaling_group_name = "my_autoscaling_group"

  SimpleAlarmScaling_policys = [
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ChangeInCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "300"
      scaling_adjustment        = "0"
      alarm_name                = "alarm"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = "2"
      alarm_metric_name         = "CPUUtilization"
      alarm_period              = "120"
      alarm_threshold           = "80"
      alarm_description         = "This metric monitors ec2 cpu utilization"
    },
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ExactCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "250"
      scaling_adjustment        = "0"
      alarm_name                = "alarm"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = "2"
      alarm_metric_name         = "CPUUtilization"
      alarm_period              = "180"
      alarm_threshold           = "90"
      alarm_description         = "This metric monitors ec2 cpu utilization"
    },
  ]

  SimpleScaling_policys = [
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ChangeInCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "300"
      scaling_adjustment        = "0"
    },
  ]
}
