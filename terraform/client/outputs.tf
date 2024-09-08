output "client_instance_id" {
  value = aws_instance.client.id
}

output "client_instance_public_ip" {
  value = aws_instance.client.public_ip
}
