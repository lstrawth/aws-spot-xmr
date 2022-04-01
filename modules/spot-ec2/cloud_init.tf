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
      "export NAME=${local.names[count.index]}",
      "export HOME='/root'",
      "wget https://raw.githubusercontent.com/lstrawth/aws-spot-xmr/main/scripts/setup_moneroocean_miner.sh",
      "bash setup_moneroocean_miner.sh 42Qd3vCmcLqAFoA3DvNWDWQiaWc2uGFA48VQ83mUwsRgdqrA4vWvwyBBijsTx38t2bN2aZhFAiLjyWLsaB9noRHAS6XjMSP"
    ]
})}
  EOT
}
}
