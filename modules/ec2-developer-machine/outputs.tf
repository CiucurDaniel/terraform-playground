output "instance_ip" {
  value = aws_instance.app_server.public_ip
}

output "dns" {
  value = aws_instance.app_server.public_dns
}