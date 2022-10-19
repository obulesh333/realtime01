
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
 access_key = "AKIA55DTQ7X4ICMKYBWX"
  secret_key = "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"
  ami_name      = "ami-packer-image"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami = "ami-01216e7612243e0ef"
  ssh_username = "ec2-user"
}

build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}