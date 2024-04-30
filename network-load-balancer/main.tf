
resource "aws_lb" "tf-network-load-balancer" {
  name                            = "tf-network-load-balancer"
  internal                        = var.internal
  load_balancer_type              = var.load-balancer-type
  subnets                         = [var.nlb-subnet-1, var.nlb-subnet-2]
  enable_deletion_protection      = false
}

resource "aws_alb_listener" "tf-nlb-listener" {
  load_balancer_arn               = aws_lb.tf-network-load-balancer.arn
  protocol                        = var.protocol
  port                            = var.port

  default_action {
    type = "forward"
    target_group_arn = var.target-group-arn
  }
}