//sg lb
module "sg" {
  source     = "./modules/sg"
  sg_details = var.sg-details
  vpc_id     = module.vpc.vpc_id


}
module "sg2" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id

  sg_details = {
    "front-asg" = {
      name        = "front-asg"
      description = "test1"
      ingress_rules = [
        {
          from_port       = 80
          to_port         = 80
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg.output-sg, "front-lb", null)]
          self            = null
        },
        # {

        #     from_port = 443
        #     to_port   = 443
        #     protocol = "tcp"
        #     cidr_blocks = ["0.0.0.0/0"]
        #     security_groups = null
        #     self = null
        # }
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
}
module "sg3" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id

  sg_details = {
    "back-lb" = {
      name        = "back-lb"
      description = "back-lb"
      ingress_rules = [
        {
          from_port       = 80
          to_port         = 80
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg2.output-sg, "front-asg", null)]
          self            = null
        },
        # {

        #     from_port = 443
        #     to_port   = 443
        #     protocol = "tcp"
        #     cidr_blocks = ["0.0.0.0/0"]
        #     security_groups = null
        #     self = null
        # }
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
}
module "sg4" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id

  sg_details = {
    "back-asg" = {
      name        = "back-asg"
      description = "back-asg"
      ingress_rules = [
        {
          from_port       = 8080
          to_port         = 8080
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg3.output-sg, "back-lb", null)]
          self            = null
        },
        # {

        #     from_port = 443
        #     to_port   = 443
        #     protocol = "tcp"
        #     # cidr_blocks = ["0.0.0.0/0"]
        #     security_groups = [lookup(module.sg.output-sg, "back-asg", null)]
        #     self = null
        # }
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
}