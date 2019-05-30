package test

import (
	"testing"
	// "fmt"
	"time"
    "math/rand"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

var terraformDirectory = "../examples"
var account            = ""
var policy_name        = "TEST_autoscaling_policy"

func randSeq(n int) string {
	letters := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    b := make([]rune, n)
    for i := range b {
        b[i] = letters[rand.Intn(len(letters))]
    }
    return "_" + string(b) + "_"
}

func Test_SetUp(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDirectory,
		Vars: map[string]interface{}{
			"policy_name": policy_name + randSeq(10),
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
			"policy_name": policy_name + randSeq(10),
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
			"policy_name": policy_name + randSeq(10),
			"SimpleScaling_policys": Policys,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.Init(t, terraformOptions)
	terraform.Apply(t, terraformOptions)
}
