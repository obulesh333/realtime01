
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
 access_key = "AKIA55DTQ7X4DVMFQXEF"
  secret_key = "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"
  ami_name      = "ami-image-packer"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami = "ami-01ec8e596ff238a5a"
  ssh_username = "ec2-user"
}
build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
    }
