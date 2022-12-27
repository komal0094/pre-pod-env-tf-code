variable "elb-name" {}
variable "bol" {}
variable "lb-type" {}
variable "lb-sg" {}

variable "ip_address_type" {}
variable "vpc_id" {}
variable "interval" {}
variable "tg-name" {}
variable "port-tcp" {}
variable "timeout"{}
variable "healthy_threshold"{}
variable "unhealthy_threshold" {}
variable "target_type" {}
variable "port-tg"{}
//nlb
# variable "nlb-name" {}
# variable "internal" {}
# # variable "pri-sub-id" {}
# variable "nlb-type" {}
# # variable "nlb-port" {}
# variable "nlb-protocol" {}
# variable "nlb-interval" {}
# variable "nlb-timeout" {}
# variable "nlb-healthy_threshold" {}
# variable "nlb-unhealthy_threshold" {}
# variable "nlb-port2"{}
# variable "nlb-target_type" {}

///for each loop
# variable "subnet" {
  
# }
variable "sub-id" {
  type = map
}

# variable "pri-sub-id" {
#     type = map
  
# }