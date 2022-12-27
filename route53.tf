module "route53" {
  source = "./modules/route53"
  vpc-id = module.vpc.vpc_id
alias-name = module.cdn.cdn-hosted_zone_domain
  alias-zone-id = module.cdn.cdn-hosted_zone_id
   alias-name-pvt-lb = module.back-lb2.private-alb-dns
  alias-zone-id-pvt-lb = module.back-lb2.private-alb-zone-id
}
