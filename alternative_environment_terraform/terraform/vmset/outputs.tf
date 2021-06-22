output "instance_name" {
  description = "作成したインスタンスの名前"
  value       = var.name
}

output "public_dns" {
  description = "作成したインスタンスのパブリックDNS"
  value       = aws_instance.this.public_dns
}
