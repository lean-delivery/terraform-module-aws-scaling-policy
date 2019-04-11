output "simpleAlarm_id" {
  value       = "${module.AS_Polisys.simpleAlarm_id}"
  description = "List of The ID-s of the health check for simpleAlarm_policy_alarm"
}

output "stepAlarm_id" {
  value       = "${module.AS_Polisys.stepAlarm_id}"
  description = "List of The ID-s of the health check for step_policy_alarm"
}

output "SimpleScaling_ASG_policy_arn" {
  value       = "${module.AS_Polisys.SimpleScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_arn" {
  value       = "${module.AS_Polisys.SimpleAlarmScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_arn" {
  value       = "${module.AS_Polisys.StepScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_arn" {
  value       = "${module.AS_Polisys.TargetTracking_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_name" {
  value       = "${module.AS_Polisys.SimpleScaling_ASG_policy_name}"
  description = "List of The scaling policys name for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_name" {
  value       = "${module.AS_Polisys.SimpleAlarmScaling_ASG_policy_name}"
  description = "List of The scaling policys name for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_name" {
  value       = "${module.AS_Polisys.StepScaling_ASG_policy_name}"
  description = "List of The scaling policys name for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_name" {
  value       = "${module.AS_Polisys.TargetTracking_ASG_policy_name}"
  description = "List of The scaling policys name for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Polisys.SimpleScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Polisys.SimpleAlarmScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Polisys.StepScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_adjustment_type" {
  value       = "${module.AS_Polisys.TargetTracking_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_group_name" {
  value       = "${module.AS_Polisys.SimpleScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_group_name" {
  value       = "${module.AS_Polisys.SimpleAlarmScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_group_name" {
  value       = "${module.AS_Polisys.StepScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_group_name" {
  value       = "${module.AS_Polisys.TargetTracking_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Polisys.SimpleScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Polisys.SimpleAlarmScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Polisys.StepScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_policy_type" {
  value       = "${module.AS_Polisys.TargetTracking_ASG_policy_policy_type}"
  description = "List of The scaling policys type for TargetTracking_ASG_policy"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}
