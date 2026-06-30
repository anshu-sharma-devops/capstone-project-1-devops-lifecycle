variable "aws_region" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu 24.04 AMI"
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  default     = "jenkins-key"
}

variable "my_ip" {
  description = "My Public IP"
  default     = "106.219.165.155/32"
}