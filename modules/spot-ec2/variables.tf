variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "name" {
  description = "EC2 instance name"
  type        = string
}

variable "num_instances" {
  description = "Number of ec2 instances to create"
  type        = number
  default     = 2
}

variable "common_sgs" {
  type    = list(any)
  default = ["sg-0ef212fae4614f457", "sg-04e340aae9e2840a4"]
}

variable "spot_price" {
  type = string
}
