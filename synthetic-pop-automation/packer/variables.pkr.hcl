variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "Testing"
}

variable "created_by" {
  type    = string
  default = "Isra-Packer"
}
