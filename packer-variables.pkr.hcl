
variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}


locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Linux" {
  access_key    = "${var.aws_access_key}"
  ami_name      = "packer${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  secret_key    = "${var.aws_secret_key}"
  source_ami    = "ami-01216e7612243e0ef"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Linux"]
}

