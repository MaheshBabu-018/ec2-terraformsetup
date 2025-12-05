# kept separate if you prefer; these are also in main.tf but included for completeness
output "instance_id" {
  description = "The EC2 Instance ID"
  value       = aws_instance.example.id
}

output "public_ip" {
  description = "Public IP assigned to the instance"
  value       = aws_instance.example.public_ip
}

output "availability_zone" {
  description = "Availability Zone where instance is running"
  value       = aws_instance.example.availability_zone
}
