terraform {
  required_version = "0.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.18.0"
    }
  }

  backend "s3" {
    bucket  = "training-environmet-terraform-tfstate"
    key     = "terraform.tfstate"
    encrypt = true

    # 直接IAM Userのアクセスキーで実行するのでIAM Role使わない
    # role_arn = ""
  }
}
