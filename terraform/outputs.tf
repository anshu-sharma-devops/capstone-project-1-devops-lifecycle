output "jenkins_master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "developer_server_public_ip" {
  value = aws_instance.developer_server.public_ip
}

output "production_server_public_ip" {
  value = aws_instance.production_server.public_ip
}

output "jenkins_ssh" {
  value = "ssh -i ~/Downloads/jenkins-key.pem ubuntu@${aws_instance.jenkins_master.public_ip}"
}

output "developer_ssh" {
  value = "ssh -i ~/Downloads/jenkins-key.pem ubuntu@${aws_instance.developer_server.public_ip}"
}

output "production_ssh" {
  value = "ssh -i ~/Downloads/jenkins-key.pem ubuntu@${aws_instance.production_server.public_ip}"
}