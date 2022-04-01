module "spot_ec2" {
  source        = "./modules/spot-ec2"
  name          = "XMR-Small-Spot-Box"
  instance_type = "t3.small"
  num_instances = 20
  spot_price    = "0.007" #small
}
