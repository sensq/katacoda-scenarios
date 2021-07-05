provider "aws" {
  # 直接IAM Userのアクセスキーで実行するのでAssume Roleしない
  # assume_role {
  #   role_arn = ""
  # }
}

locals {
  # 頻繁に変更する値
  set_num = 1                       # 作成したい台数を指定
  ami_id  = "ami-078d0761ca92c1e2a" # 任意のAMI IDを指定

  # 一度決めたら基本的に変更不要な値
  vpc_id               = "vpc-6c712805"    # インスタンスを配置する適当なVPCのIDを指定
  cidr_block           = "10.0.190.0/24"   # 上記VPCに作成可能なサブネット用のCIDRブロックを指定
  availability_zone    = "ap-northeast-1b" # インスタンスを配置するAZを指定
  instance_type        = "t2.small"
  instance_volume_type = "gp2"
  instance_volume_size = 8
  user_data            = <<EOF
#!/bin/bash
rm -rf /tmp/*
rm -rf /root/.ssh/known_hosts
rm -rf /root/.bash_history
  EOF

  ports = {
    code_server  = 80
    nginx_test_1 = 8082
    nginx_test_2 = 8083
    nginx_test_3 = 8084
  }

  tags = {
    Name        = "rookie-training"
    Environment = "training"
  }
}

# インスタンスに関連付けるセキュリティグループ
resource "aws_security_group" "this" {
  name = "training_security_group"

  vpc_id = local.vpc_id
  tags   = local.tags

  ingress {
    description = "code-server"
    from_port   = local.ports.code_server
    to_port     = local.ports.code_server
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NginX-01"
    from_port   = local.ports.nginx_test_1
    to_port     = local.ports.nginx_test_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NginX-02"
    from_port   = local.ports.nginx_test_2
    to_port     = local.ports.nginx_test_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NginX-03"
    from_port   = local.ports.nginx_test_3
    to_port     = local.ports.nginx_test_3
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# インスタンスを配置するサブネット
resource "aws_subnet" "this" {
  vpc_id            = local.vpc_id
  cidr_block        = local.cidr_block
  availability_zone = local.availability_zone
  tags              = local.tags
}

# SSMで接続できるようにするためのインスタンスプロファイル
module "ec2_ssm_profile" {
  source = "./instance_profile"

  name_prefix = "training"
  tags        = local.tags
}

module "vmset" {
  source   = "./vmset"
  for_each = zipmap(range(local.set_num), range(local.set_num))

  name                        = format("training-%03d", each.value)
  ami_id                      = local.ami_id
  instance_type               = local.instance_type
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  iam_instance_profile        = module.ec2_ssm_profile.name
  tags                        = local.tags

  root_block_device = {
    volume_type           = local.instance_volume_type
    volume_size           = local.instance_volume_size
    delete_on_termination = true
  }

  security_groups = [
    aws_security_group.this.id
  ]
}

output "vmset" {
  value = module.vmset
}
