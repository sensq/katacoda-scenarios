variable "tags" {
  description = "このモジュールで作成されるリソースに付与するタグ"
  type        = map(string)
  default     = {}
}


variable "name" {
  description = "作成するインスタンスの名前"
  type        = string
}

variable "ami_id" {
  description = "作成するインスタンスで使用するAMI ID"
  type        = string
}

variable "instance_type" {
  description = "作成するインスタンスのタイプ"
  type        = string
}

variable "subnet_id" {
  description = "作成するインスタンスを起動するサブネットID"
  type        = string
}

variable "key_name" {
  description = "作成するインスタンスで使用するSSH用のキーペア名"
  type        = string
}

variable "associate_public_ip_address" {
  description = "自動的にパブリックIPを割り当てるかどうか"
  type        = bool
}

variable "root_block_device" {
  description = "作成するインスタンスのEBS設定"
  type = object({
    volume_type           = string
    volume_size           = string
    delete_on_termination = bool
  })
}

variable "security_groups" {
  description = "作成するインスタンスで使用するセキュリティグループのリスト"
  type        = list(string)
}
