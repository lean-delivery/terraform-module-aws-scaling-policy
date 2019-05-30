# aws-spot-autoscaling test

## Description

In this .go-file include 3 tests: Create/destroy empty policy, create/destroy 2 SimpleAlarmScaling_policy and create/destroy one SimpleScaling_policy.

## List of created resources

| Resource | Count |
|------|---|
| autoscaling policy | n |
| cloudwatch metric alarm | n |


## List of created resources for env

| Resource | Count |
|------|---|
| VPC | 1/n |
| subnets | n |
| launch configuration | 1/n |
| autoscaling group | 1/n |

## Usage

```
go test
```

## Run Time

300s - 450s


## Require Inputs

| Variable | Description | Type | Example value |
|------|-------------|:----:|:-----:|
| autoscaling_group_name |  | string | "my_autoscaling_group_name" |


## Permissions

| Permission |
|------|
| cloudwatch:PutDashboard |
| cloudwatch:PutMetricData |
| cloudwatch:DeleteAlarms |
| cloudwatch:PutMetricAlarm |
| cloudwatch:DeleteDashboards |
| cloudwatch:DescribeAlarmHistory |
| cloudwatch:EnableAlarmActions |
| cloudwatch:DisableAlarmActions |
| cloudwatch:DescribeAlarmsForMetric |
| cloudwatch:ListTagsForResource |
| cloudwatch:DescribeAlarms |
| cloudwatch:SetAlarmStat |
| autoscaling:ExitStandby |
| autoscaling:BatchPutScheduledUpdateGroupAction |
| autoscaling:EnterStandby |
| autoscaling:DescribePolicies |
| autoscaling:DescribeLaunchConfigurations |
| autoscaling:DeletePolicy |
| autoscaling:PutScheduledUpdateGroupAction |
| autoscaling:PutScalingPolicy |
| autoscaling:DescribeAutoScalingGroups |
| autoscaling:UpdateAutoScalingGroup |
| autoscaling:DeleteNotificationConfiguration |
| autoscaling:SetInstanceHealth |
| autoscaling:TerminateInstanceInAutoScalingGroup |
| autoscaling:PutNotificationConfiguration |
| autoscaling:AttachLoadBalancers |
| autoscaling:DetachLoadBalancers |
| autoscaling:BatchDeleteScheduledAction |
| autoscaling:EnableMetricsCollection |
| autoscaling:ResumeProcesses |
| autoscaling:SetDesiredCapacity |
| autoscaling:DetachLoadBalancerTargetGroups |
| autoscaling:AttachLoadBalancerTargetGroups |
| autoscaling:CreateLaunchConfiguration |
| autoscaling:AttachInstances |
| autoscaling:CompleteLifecycleAction |
| autoscaling:DisableMetricsCollection |
| autoscaling:DeleteLaunchConfiguration |
| autoscaling:SetInstanceProtection |
| autoscaling:DeleteAutoScalingGroup |
| autoscaling:DeleteLifecycleHook |
| autoscaling:CreateAutoScalingGroup |
| autoscaling:DeleteScheduledAction |
| autoscaling:RecordLifecycleActionHeartbea |
| ec2:* |

or

| Permission |
|------|
| cloudwatch:* |
| ec2:* |
| autoscaling:* |



## Terraform versions

Terraform v0.12.0

## Golang versions

go version go1.12.5 darwin/amd64


## Contributing

Thank you for your interest in contributing! Please refer to [CONTRIBUTING.md](https://github.com/lean-delivery/tf-module-aws-spot-autoscaling/blob/master/CONTRIBUTING.md) for guidance.

## License

Apache

## Authors

authors:
  - Lean Delivery Team <team@lean-delivery.com>
