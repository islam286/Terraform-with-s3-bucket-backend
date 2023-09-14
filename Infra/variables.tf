variable "ubuntu_ami_id" {
  description = "ami_id for the bastion host and the instance-app"
  default     = data.aws_ami.latest_ubuntu.id
}


variable "db_password"{
  description = "the password used for the rds db "
  type = string
  
}