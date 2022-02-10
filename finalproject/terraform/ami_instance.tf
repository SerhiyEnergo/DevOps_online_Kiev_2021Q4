rovider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "lastest_ubuntu_20_04" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }
}
