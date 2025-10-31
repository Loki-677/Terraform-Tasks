output "public_ip" {
  value = aws_instance.slave.public_ip
}
output "id" {
  value = aws_instance.slave.id
}
