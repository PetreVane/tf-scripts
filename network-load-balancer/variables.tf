
variable "nlb-subnet-1" {
  type = string
  description = "The subnets toward which the nlb will redirect traffic"
}

variable "nlb-subnet-2" {
  type = string
  description = "The subnets toward which the nlb will redirect traffic"
}

variable "target-group-arn" {
  type = string
  description = "The arn of the target group used by the listener"
}

variable "internal" {
  type = bool
  description = "Whether the nlb is internal or internet facing"
  default = false
}

variable "load-balancer-type" {
  description = "The type of load balancer"
  default = "network"
  type = string
}

variable "protocol" {
  type = string
  description = "The protocol used in the target group"
  default = "TCP"
}

variable "port" {
  type = number
  description = "The instance port on which the target group will redirect connections"
  default = 8080
}