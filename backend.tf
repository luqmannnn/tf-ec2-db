terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"         # Terraform State bucket name
    key    = "tf-ec2-db-luqman.tfstate" # Name of your tfstate file
    region = "us-east-1"                # Terraform State bucket region
  }
}
