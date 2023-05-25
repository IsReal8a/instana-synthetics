build {
  name        = "ubuntu_22_amd64"
  description = <<EOF
This build creates Ubuntu images for ubuntu version :
* 22.04
For the following builder :
* amazon-ebs
For the Instana Synthetic PoP
EOF
  sources = [
    "source.amazon-ebs.ubuntu_22_amd64"
  ]
  provisioner "shell" {
    inline = [
      "echo Installing Updates",
      "sudo apt-get update",
      "sudo apt-get upgrade -y"
    ]
  }
  post-processor "manifest" {
    output = "synthetic-pop-manifest.json"
  }
}