module "cdn" {
  source      = "./modules/cdn"
  domain_name = module.front-lb.public-alb-dns
  origin_id   = var.origin_id
}
