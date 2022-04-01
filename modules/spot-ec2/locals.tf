locals {
  names = [for i in range(var.num_instances) :
  "${var.name}-${i + 1}"]
}
