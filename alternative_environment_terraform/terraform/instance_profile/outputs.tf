output "name" {
  description = "Terraform実行用インスタンスのインスタンスプロファイルの名前"
  value       = aws_iam_instance_profile.this.name
}

output "arn" {
  description = "Terraform実行用インスタンスのインスタンスプロファイルのARN"
  value       = aws_iam_instance_profile.this.arn
}

output "id" {
  description = "Terraform実行用インスタンスのインスタンスプロファイルのID"
  value       = aws_iam_instance_profile.this.id
}

output "role_arn" {
  description = "Terraform実行用インスタンスのインスタンスプロファイルにアタッチするIAM RoleのARN"
  value       = aws_iam_role.this.arn
}

output "role_unique_id" {
  description = "Terraform実行用インスタンスのインスタンスプロファイルにアタッチするIAM RoleのユニークID"
  value       = aws_iam_role.this.unique_id
}
