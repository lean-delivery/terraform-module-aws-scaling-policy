resource "random_string" "postfix" {
  length  = 16
  special = true
}

resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "${"Env for test spot_autoscaling_${random_string.postfix.result}"}"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${"Env for test spot_autoscaling_${random_string.postfix.result}"}"
  }
}

resource "aws_launch_configuration" "as_conf" {
  name          = "${"webconfig for test spot_autoscaling_${random_string.postfix.result}"}"
  image_id      = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "test_asg" {
  name                      = "${"test_autoscaling_group_${random_string.postfix.result}"}"
  desired_capacity          = 1
  max_size                  = 1
  min_size                  = 1
  vpc_zone_identifier       = "${list(aws_subnet.test_subnet.id)}"
  wait_for_elb_capacity     = 0
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.as_conf.name}"
}
