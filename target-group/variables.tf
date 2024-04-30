
variable "vpc_id" {
  type = string
  description = "The id of the VPC used with this target group"
}

variable "protocol" {
  type = string
  description = "The protocol used in the target group"
  default = "TCP"
}

variable "target-type" {
  type = string
  description = "The type of the target. Could be instance or a ALB"
  default = "instance"
}

variable "port" {
  type = number
  description = "The instance port on which the target group will redirect connections"
  default = 8080
}