output "instance_public_ip" {
    value = aws_instance.nginxserver.public_ip
    description = "The public IP address of the EC2 instance"
}

output "instance_url" {
    value = "http://${aws_instance.nginxserver.public_ip}"
    description = "The URL of the Nginx server"
}