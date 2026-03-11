output "aws-public-ip" {
  value = aws_instance.infra-instance[*].public_ip
}
output "instance-public-dns" {
  value = aws_instance.infra-instance[*].public_dns
}
output "instance-private-ip"{
    value = aws_instance.infra-instance[*].private_ip
}
output "instance-private-dns" {
  value = aws_instance.infra-instance[*].private_dns
}