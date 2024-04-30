
output "nlb-arn" {
  description = "The arn of the network load balancer"
  value = aws_lb.tf-network-load-balancer.arn
}