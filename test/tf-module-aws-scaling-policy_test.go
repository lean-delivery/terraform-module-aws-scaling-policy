package test

import (
	"testing"
	// "fmt"
	"time"
    "math/rand"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

var terraformDirectory     = "../examples"
var region                 = "us-east-1"
var account                = ""
var policy_name            = "TEST_autoscaling_policy"
var autoscaling_group_name = "testgroup"

func randSeq(n int) string {
	letters := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    b := make([]rune, n)
    for i := range b {
        b[i] = letters[rand.Intn(len(letters))]
    }
    return string(b)
}

func Test_SetUp(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDirectory,
		Vars: map[string]interface{}{
			"aws_region": region,
			"policy_name": policy_name + randSeq(10),
			"autoscaling_group_name": autoscaling_group_name,
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.Init(t, terraformOptions)
	terraform.Apply(t, terraformOptions)
	account = terraform.Output(t, terraformOptions, "account_id")
}


func Test_SimpleAlarmScaling_policy(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	First_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ChangeInCapacity",
		"policy_type":               "SimpleScaling",
		"cooldown":                  "300",
		"scaling_adjustment":        "0",
		"alarm_name":                "alarm",
		"alarm_comparison_operator": "GreaterThanOrEqualToThreshold",
		"alarm_evaluation_periods":  "2",
		"alarm_metric_name":         "CPUUtilization",
		"alarm_period":              "120",
		"alarm_threshold":           "80",
		"alarm_description":         "This metric monitors ec2 cpu utilization",
	}

	Second_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ExactCapacity",
		"policy_type":               "SimpleScaling",
	   	"cooldown":                  "250",
		"scaling_adjustment":        "0",
		"alarm_name":                "alarm",
		"alarm_comparison_operator": "GreaterThanOrEqualToThreshold",
		"alarm_evaluation_periods":  "2",
		"alarm_metric_name":         "CPUUtilization",
		"alarm_period":              "180",
		"alarm_threshold":           "90",
		"alarm_description":         "This metric monitors ec2 cpu utilization",
	}

	Policys := []map[string]interface{}{First_Policy, Second_Policy}

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDirectory,

		Vars: map[string]interface{}{
			"aws_region": region,
			"policy_name": policy_name + randSeq(10),
			"autoscaling_group_name": autoscaling_group_name,
			"SimpleAlarmScaling_policys": Policys,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.Init(t, terraformOptions)
	terraform.Apply(t, terraformOptions)
}


func Test_SimpleScaling_policy(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	First_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ChangeInCapacity",
		"policy_type":               "SimpleScaling",
		"cooldown":                  "300",
		"scaling_adjustment":        "0",
	}

	Policys := []map[string]interface{}{First_Policy}

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDirectory,

		Vars: map[string]interface{}{
			"aws_region": region,
			"policy_name": policy_name + randSeq(10),
			"autoscaling_group_name": autoscaling_group_name,
			"SimpleScaling_policys": Policys,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.Init(t, terraformOptions)
	terraform.Apply(t, terraformOptions)
}
