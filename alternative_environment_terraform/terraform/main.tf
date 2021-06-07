provider "aws" {
  # 直接IAM Userのアクセスキーで実行するのでAssume Roleしない
  # assume_role {
  #   role_arn = ""
  # }
}

locals {
  set_num    = 1                       # 作成したい台数を指定
  vpc_id     = "vpc-6c712805"          # インスタンスを配置する適当なVPCのIDを指定
  cidr_block = "10.0.190.0/24"         # 上記VPCに作成可能なサブネット用のCIDRブロックを指定
  ami_id     = "ami-09c66876b1a85e55f" # 任意のAMI IDを指定
}

# インスタンスに関連付けるセキュリティグループ
resource "aws_security_group" "this" {
  name = "training_2021_security_group"

  vpc_id = local.vpc_id
  ingress {
    description = "NginX-01"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NginX-02"
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "NginX-03"
    from_port   = 8084
    to_port     = 8084
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "code-server"
    from_port   = 9999
    to_port     = 9999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "2021-rookie-training"
    Environment = "training"
  }
}

# インスタンスを配置するサブネット
resource "aws_subnet" "this" {
  vpc_id     = local.vpc_id
  cidr_block = local.cidr_block

  tags = {
    Name        = "2021-rookie-training"
    Environment = "training"
  }
}

# SSMで接続できるようにするためのインスタンスプロファイル
module "ec2_ssm_profile" {
  source = "./instance_profile"

  name_prefix = "rookie-training"
  tags = {
    Name        = "2021-rookie-training"
    Environment = "training"
  }
}

module "vmset" {
  source   = "./vmset"
  for_each = zipmap(range(local.set_num), range(local.set_num))

  name                        = format("training-%03d", each.value)
  ami_id                      = local.ami_id
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  iam_instance_profile        = module.ec2_ssm_profile.name

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }

  security_groups = [
    aws_security_group.this.id
  ]

  tags = {
    Environment = "training"
  }
}

output "public_ip" {
  value = module.vmset
}
