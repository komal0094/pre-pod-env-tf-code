//vpc variable
variable "public-sub" {}
variable "private-sub" {}
variable "igw-cidr" {}
variable "vpc-cidr" {}
//varible sg
variable "sg-details" {}
//lb variable
variable "elb-name" {}
variable "bol" {}
variable "port-tg" {}
variable "tg-name" {}
variable "lb-type" {}
variable "ip" {}
variable "interval" {}
variable "timeout" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "target_type" {}
variable "port-tcp1" {}

//lb2 module
variable "elb-name2" {}
variable "bol2" {}
variable "tg-name2" {}
variable "port-tcp" {}
variable "port-tg1" {}


//nlb variable
# variable "nlb-name" {}
# variable "internal" {}
# variable "nlb-type" {}
# # variable "nlb-port" {}
# variable "nlb-protocol" {}
# variable "nlb-interval" {}
# variable "nlb-timeout" {}
# variable "nlb-healthy_threshold" {}
# variable "nlb-unhealthy_threshold" {}
# variable "nlb-port2" {}
# variable "nlb-target_type" {}

//asg variables
variable "ami" {}
variable "ec2-type" {}
variable "key" {}
variable "des-cap" {}
variable "min-size" {}
variable "max-size" {}
variable "lc-name" {}
variable "name-pre" {}

//asg module2 var
variable "ami2" {}
variable "name-pre2" {}
variable "des-cap2" {}
variable "min-size2" {}
variable "max_size2" {}
variable "lc-name2" {}

//cdn
variable "origin_id" {}