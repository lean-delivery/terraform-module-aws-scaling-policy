provider "aws" {
  region = "${var.region}"
}

data "aws_caller_identity" "current" {}

module "AS_Polisys" {
  source                     = "../"
  policy_name                = "${var.policy_name}"
  autoscaling_group_name     = "${var.autoscaling_group_name}"
  SimpleScaling_policys      = "${var.SimpleScaling_policys}"
  SimpleAlarmScaling_policys = "${var.SimpleAlarmScaling_policys}"
  StepScaling_policys        = "${var.StepScaling_policys}"
  TargetTracking_policys     = "${var.TargetTracking_policys}"
}
