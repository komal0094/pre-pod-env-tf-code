//asg for each module
module "front-asg" {
  source      = "./modules/asg"
  asg-sg      = lookup(module.sg2.output-sg, "front-asg", null)
  asg-snets   = [lookup(module.vpc.pub-snet-id, "pub-sub-1", null), lookup(module.vpc.pub-snet-id, "pub-sub-2", null)]
  tg_arn      = module.front-lb.tg-arn
  ami         = var.ami
  ec2-type    = var.ec2-type
  key_name    = var.key
  name_prefix = var.name-pre
  des-cap     = var.des-cap
  min_size    = var.min-size
  max_size    = var.max-size
  lc-name     = var.lc-name
}
module "back-asg2" {
  source      = "./modules/asg"
  asg-sg      = lookup(module.sg4.output-sg, "back-asg", null)
  asg-snets   = [lookup(module.vpc.pri-snet-id, "pri-sub-1", null), lookup(module.vpc.pri-snet-id, "pri-sub-2", null)]
  tg_arn      = module.back-lb2.tg-arn
  ami         = var.ami2
  ec2-type    = var.ec2-type
  key_name    = var.key
  name_prefix = var.name-pre2
  des-cap     = var.des-cap2
  min_size    = var.min-size2
  max_size    = var.max_size2
  lc-name     = var.lc-name2
}