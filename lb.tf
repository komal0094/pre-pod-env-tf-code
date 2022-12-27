module "front-lb" {
  source = "./modules/lb"
  lb-sg  = lookup(module.sg.output-sg, "front-lb", null)
  sub-id = {
    lb-sub = {
      snet-id = lookup(module.vpc.pub-snet-id, "pub-sub-1", null)
    },
    lb-sub2 = {
      snet-id = lookup(module.vpc.pub-snet-id, "pub-sub-2", null)
    }
  }
  vpc_id              = module.vpc.vpc_id
  elb-name            = var.elb-name
 port-tg               = var.port-tg
  bol                 = var.bol
  lb-type             = var.lb-type
  ip_address_type     = var.ip
  interval            = var.interval
  timeout             = var.timeout
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  target_type         = var.target_type
  tg-name = var.tg-name
  port-tcp = var.port-tcp1
}

//alb module2 variable
module "back-lb2" {
  source = "./modules/lb"
  lb-sg  = lookup(module.sg3.output-sg, "back-lb", null)
  sub-id = {
    lb-sub = {
      snet-id = lookup(module.vpc.pri-snet-id, "pri-sub-1", null)
    },
    lb-sub2 = {
      snet-id = lookup(module.vpc.pri-snet-id, "pri-sub-2", null)
    }
  }
  vpc_id              = module.vpc.vpc_id
  elb-name            = var.elb-name2
  port-tg               = var.port-tg1
  bol                 = var.bol2
  lb-type             = var.lb-type
  ip_address_type     = var.ip
  interval            = var.interval
  timeout             = var.timeout
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  target_type         = var.target_type
  tg-name = var.tg-name2
  port-tcp = var.port-tcp
  
}
