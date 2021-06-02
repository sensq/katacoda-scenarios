provider "aws" {
  # 直接IAM Userのアクセスキーで実行するのでAssume Roleしない
  # assume_role {
  #   role_arn = ""
  # }
}

locals {
  # 作成する台数を指定
  set_num = 2
}

module "vmset" {
  source = "./vmset"
  for_each = zipmap(range(local.set_num), range(local.set_num))

  name                        = format("training-%03d", each.value)
  ami_id                      = "ami-0ca38c7440de1749a"  # TODO: AMI作成後に書き換える
  instance_type               = "t2.medium"
  subnet_id                   = "subnet-53c0d41a"  # 事前作成済みの指定のサブネットID
  key_name                    = "hoge"  # 事前作成済みの指定のキーペア名
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }

  security_groups = [
    "sg-0cd2ccf4dfb60327a"  # 事前作成済みの指定のセキュリティグループID
  ]

  tags = {
    Environment = "training"
  }
}

output "public_ip" {
  value = module.vmset
}
