# modules/ec2_instance/main.tf

variable "subnet_id" {
  description = "ID of the subnet"
}

variable "security_group_ids" {
  description = "List of security group IDs"
}

resource "aws_instance" "my_ec2_instances" {
  ami             = "ami-0f1b9ed1b81d78f76"  # Replace with your desired AMI ID
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_id
  security_groups  = var.security_group_ids

  tags = {
    Name = "My_EC2_Instance"
  }
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2_instances.id
}

output "public_ip" {
  value = aws_instance.my_ec2_instances.public_ip
}
