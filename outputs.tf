# outputs.tf

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.subnets.subnet_a_id
}

output "route_table_id" {
  value = module.route_tables.route_table_id
}

output "internet_gateway_id" {
  value = module.route_tables.internet_gateway_id
}

output "web_sg_id" {
  value = module.security_groups.web_sg_id
}

output "ec2_instance_id" {
  value = module.ec2_instances.ec2_instance_id
}

# Define outputs for the main configuration
output "ec2_instance_ip" {
  value = module.ec2_instances.public_ip
}
