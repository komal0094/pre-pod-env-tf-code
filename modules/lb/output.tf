output "tg-arn" {
    value = aws_lb_target_group.elb-tg-001.arn
  
}
# output "nlb-tg-arn" {
#     value = aws_lb_target_group.nlb-tg-02.arn
  
# }
output "public-alb-dns" {
  value = aws_lb.elb-test.dns_name
}

//tomcat zone
output "private-alb-dns" {
  value = aws_lb.elb-test.dns_name
}

output "private-alb-zone-id" {
  value = aws_lb.elb-test.zone_id
}