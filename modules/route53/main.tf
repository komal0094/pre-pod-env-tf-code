//hosted zone
resource "aws_route53_zone" "nginx-pub-zone" {
  name = "nginx-pub.com"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "r53_records-pub" {
  zone_id = aws_route53_zone.nginx-pub-zone.zone_id
  name    = "public"
  type    = "A"

  
    alias {
    name                   = var.alias-name
    zone_id                = var.alias-zone-id
    evaluate_target_health = true
  }
  
}

//private hosted zone 
resource "aws_route53_zone" "tomcat-pri-zone" {
  name = "tomcat-pri.com"

  vpc {
    vpc_id = var.vpc-id
  }
}

//alias record 
resource "aws_route53_record" "r53_records-pvt" {
  zone_id = aws_route53_zone.tomcat-pri-zone.zone_id
  name    = "private"
  type    = "A"

 alias {
    name                   = var.alias-name-pvt-lb
    zone_id                = var.alias-zone-id-pvt-lb
    evaluate_target_health = true
  }
}
