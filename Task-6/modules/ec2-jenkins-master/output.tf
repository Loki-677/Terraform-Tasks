output "public_ip" {
  value = aws_instance.master.public_ip
}
output "id" {
  value = aws_instance.master.id
}