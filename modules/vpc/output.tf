output "vpc-id" {
  value = aws_vpc.this.id
}
output "public-subent-id" {
  value = aws_subnet.public[0].id
}