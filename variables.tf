variable "dynamodb_table_name" {
  default = "luqman-bookinventory"
  type    = string
}

variable "vpc_name" {
  default = "ce9-coaching-shared-vpc"
}

variable "subnet_name" {
  default = "ce9-coaching-shared-vpc-public-us-east-1a"
}

variable "ec2_name" {
  default = "luqman-tf-ec2"
}

variable "sg_name" {
  default = "luqman-tf-sg"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "luqman-test-keypair"
}

variable "policy_name" {
  default = "luqman-dynamodb-read-policy"
}

variable "role_name" {
  default = "luqman-dynamodb-read-role"
}

variable "accountid" {
  default = "255945442255"
}

variable "region" {
  default = "us-east-1"
}