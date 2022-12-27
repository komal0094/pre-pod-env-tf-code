public-sub = {
  pub-sub-1 = {
    availability_zone = "us-east-1a"
    cidr_block        = "10.0.0.0/18"
  },
  pub-sub-2 = {
    availability_zone = "us-east-1b"
    cidr_block        = "10.0.64.0/18"
  }

}
//
private-sub = {
  pri-sub-1 = {
    availability_zone = "us-east-1a"
    cidr_block        = "10.0.128.0/18"
  },
  pri-sub-2 = {
    availability_zone = "us-east-1b"
    cidr_block        = "10.0.192.0/18"
  }
}
igw-cidr = "0.0.0.0/0"
vpc-cidr = "10.0.0.0/16"

//sg-details
sg-details = {
  "front-lb" = {
    name        = "front-lb"
    description = "test"
    # vpc_id = module.vpc.vpc_id

    ingress_rules = [
      {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = null
        self            = null
      },
      {

        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = null
        self            = null
      }
    ]

    egress = {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}


//lb variables
elb-name            = "elb-test"
bol                 = false
lb-type             = "application"
ip                  = "ipv4"
port-tg             = "80"
interval            = 10
timeout             = 5
healthy_threshold   = 5
unhealthy_threshold = 2
target_type         = "instance"
tg-name = "front-tg"
port-tcp1 = "80"

//lb2 variable
elb-name2 = "elb-test2"
bol2      = true
port-tg1 = "8080"
tg-name2 = "back-tg"
port-tcp = "8080"

//nlb variables
#   nlb-name = "nlb-test"
#   internal = true
#   nlb-type = "network"
# #   nlb-port = "80"
#   nlb-protocol = "TCP"
#   nlb-interval = 10
#   nlb-timeout = 5
#   nlb-healthy_threshold = 5
#   nlb-unhealthy_threshold= 2
#   nlb-port2 = 8080
#   nlb-target_type = "instance" 


//asg variables
ami      = "ami-0f93563a114d0bee1"
ec2-type = "t2.micro"
key      = "key001"
des-cap  = 1
min-size = 1
max-size = 3
lc-name  = "asg-front-lc"
name-pre = "asg-front-test"
//asg module2
ami2      = "ami-071a311a6aaebbd83"
name-pre2 = "asg-back-test"
des-cap2  = 1
min-size2 = 1
max_size2 = 3
lc-name2  = "asg-back-test"

//cdn variable
origin_id = "content delivery network for Application load balancer"

















  