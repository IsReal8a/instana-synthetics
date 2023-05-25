data "amazon-ami" "ubuntu_22_amd64" {
  filters = {
    name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
}

source "amazon-ebs" "ubuntu_22_amd64" {
  ami_name      = "synthetic-ubuntu-aws-{{timestamp}}"
  instance_type = var.instance_type
  region        = var.aws_region
  source_ami    = "${data.amazon-ami.ubuntu_22_amd64.id}"
  ssh_username  = "ubuntu"
  tags = {
    "Name"        = "SyntheticPoP"
    "Environment" = var.aws_region
    "OS_Version"  = "Ubuntu 22.04"
    "Release"     = "Latest"
    "Created-by"  = var.created_by
  }
}
