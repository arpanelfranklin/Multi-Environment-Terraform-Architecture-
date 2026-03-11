# resource of key pair 
resource "aws_key_pair" "infra-key" {
  key_name = "${var.env}-key"
  public_key = file("terraform-key-ec2.pub")
  tags = {
    name= "${var.env}-key"
    environment = var.env
  }
}

# security group 
resource "aws_security_group" "infra-security-group" {
  name = "${var.env}-security-group"
  vpc_id = var.vpc-id
  description = "This is the security group for ${var.env} environment"
  
  #opening ports
  dynamic "ingress" {
    for_each = var.ingress-rules
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress = {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks= ["0.0.0.0/0"]
    description = "opening for all port and all porotcol"
  }

  tags = {
    name = "${var.env}-security-group"
    environment = var.env
  }
}

# ec2 instance 
resource "aws_instance" "infra-instance" {
  count = var.instance-count
  depends_on = [ aws_security_group.infra-security-group, aws_key_pair.infra-key, var.vpc-id ]
  key_name = aws_key_pair.infra-key.key_name
  vpc_security_group_ids = [aws_security_group.infra-security-group.this.id]
  instance_type = var.instance-type
  ami = var.ami
  root_block_device {
    volume_size = var.instance-volume-size
    volume_type = var.instance-volume-type 
  }
  tags = {
    name = "${var.env}-infra-instance"
    environment = var.env
  }
}