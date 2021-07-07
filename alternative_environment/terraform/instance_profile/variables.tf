variable "tags" {
  description = "このモジュールで作成されるリソースに付与するタグ"
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "このモジュールで作成されるリソースの名前に付与する接頭辞"
  type        = string
}
