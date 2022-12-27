//create tg for application-lb
resource "aws_lb_target_group" "elb-tg-001" {
  health_check {
    interval = var.interval
    path = "/"
    port = var.port-tcp
    protocol = "HTTP"
    timeout = var.timeout
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
  name     = var.tg-name
  port     = var.port-tg
  protocol = "HTTP"
  target_type = var.target_type
  vpc_id   = var.vpc_id
}

//lb application create
resource "aws_lb" "elb-test" {
  name               = var.elb-name
  internal           = var.bol
  load_balancer_type = var.lb-type
  security_groups    = [var.lb-sg]
  subnets            = [for v in var.sub-id : v.snet-id]
  # subnets            = var.subnet
ip_address_type      = var.ip_address_type
#   enable_deletion_protection = false
tags = {
    Name = "${terraform.workspace}-dev-elb"
    env = terraform.workspace
  }
}

//lb listener for application
resource "aws_lb_listener" "elb-listener" {
  load_balancer_arn = aws_lb.elb-test.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-tg-001.arn
  }
}






