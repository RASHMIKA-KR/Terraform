# modules/subnets/main.tf

variable "vpc_id" {
  description = "ID of the VPC"
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_a"
  }
}

output "subnet_a_id" {
  value = aws_subnet.subnet_a.id
}
