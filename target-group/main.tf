
resource "aws_alb_target_group" "tf-target-group" {
  name                = "tf-target-group"
  port                = var.port
  protocol            = var.protocol
  vpc_id              = var.vpc_id
  target_type         = var.target-type
  health_check {
    protocol  = var.protocol
    port      = var.port
  }
}