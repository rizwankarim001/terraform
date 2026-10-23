output "ec2_ip" {
  value = "you have successfully created ec2 and its public ip is: ${aws_instance.demo-instance.public_ip}"
}