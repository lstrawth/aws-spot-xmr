output "instances" {
  description = "EC2 instance information"
  value = [for i in aws_spot_instance_request.spot_ec2 : {
    name = i.tags["Name"]
  }]
}
