variable "aws_region" {
  default = "us-east-1"
}

variable "policy_name" {
  type        = "string"
  description = "name for policy for autoscaling group"
  default     = "example"
}

variable "SimpleScaling_policys" {
  type        = "list"
  description = "A list of AS-policys. Trigger for scaling ASG. Only policy_type SimpleScaling"
  default     = []
}

variable "SimpleAlarmScaling_policys" {
  type        = "list"
  description = "A list of AS-policys. Trigger for scaling ASG. Only policy_type SimpleScaling"
  default     = []
}

variable "StepScaling_policys" {
  type        = "list"
  description = "A list of AS-policys. Trigger for scaling ASG. Only policy_type StepScaling"
  default     = []
}

variable "TargetTracking_policys" {
  type        = "list"
  description = "A list of AS-policys. Trigger for scaling ASG. Only policy_type TargetTrackingScaling"
  default     = []
}
