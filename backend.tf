terraform {
  backend "s3" {
    encrypt = true
    bucket = "jlee-aws-spot-xmr"
    dynamodb_table = "jlee-aws-spot-xmr-tf-state-lock"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

