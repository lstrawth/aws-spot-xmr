data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_spot_instance_request" "spot_ec2" {
  count                  = var.num_instances
  ami                    = data.aws_ami.ami.id
  spot_price             = var.spot_price
  instance_type          = var.instance_type
  key_name               = "generic_ec2"
  user_data              = data.cloudinit_config.user_data.rendered
  vpc_security_group_ids = var.common_sgs
  root_block_device {
    encrypted   = false
    volume_type = "gp2"
    volume_size = 8
  }
  tags = {
    Name = local.names[count.index]
  }
  volume_tags = {
    Name = "${local.names[count.index]}-root"
  }
  lifecycle {
    prevent_destroy = false
  }
}
