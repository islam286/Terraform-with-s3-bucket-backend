variable "ubuntu_ami_id"{
  description = "ami_id for the bastion host and the instance-app"
  type = string
  default="ami-0989fb15ce71ba39e"
}
variable "db_password"{
  description = "the password used for the rds db "
  type = string
  
}