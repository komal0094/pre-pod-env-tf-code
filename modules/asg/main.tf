//asg launch configuration
resource "aws_launch_configuration" "asg_conf" {
 name_prefix          = var.lc-name
  image_id      = var.ami
  instance_type = var.ec2-type
  security_groups = [var.asg-sg]
  key_name = var.key_name
user_data = <<-EOF
#!/bin/bash
/opt/tomcat/bin/startup.sh
  EOF
  lifecycle {
    create_before_destroy = true
  }

}

///asg resource

resource "aws_autoscaling_group" "asg-test" {

  vpc_zone_identifier = var.asg-snets 
  name_prefix               = var.name_prefix
  desired_capacity          = var.des-cap
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_conf.name
  target_group_arns =  [var.tg_arn]

  lifecycle {
    create_before_destroy = true
  }
}