output "instance_name" {
  description = "作成したインスタンスの名前"
  value       = var.name
}

output "public_ip" {
  description = "作成したインスタンスのパブリックIP"
  value       = aws_instance.this.public_ip
}
