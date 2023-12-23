# modules/route_tables/main.tf

variable "vpc_id" {
  description = "ID of the VPC"
}

# Declare the aws_internet_gateway resource
resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "My_Internet_Gateway"
  }
}
output "internet_gateway_id" {
  value = aws_internet_gateway.my_igw.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "My_Route_Table"
  }
}

output "route_table_id" {
  value = aws_route_table.my_route_table.id
}
