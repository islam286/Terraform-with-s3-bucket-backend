resource "aws_instance" "app_instance" {
  ami           = var.ubuntu_ami_id
  instance_type = "t3.micro"

  # Use a count loop to create 3 instances, one in each of the specified subnets
  count = 3
  subnet_id     = module.vpc.private_subnets[count.index]
  key_name      = aws_key_pair.my_keypair.key_name
  vpc_security_group_ids  = [aws_security_group.app_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y mysql-client 
    
    
    echo "[client]
    host=${aws_db_instance.rds.endpoint}
    user=db_user
    password=\"${var.db_password}\"
    " > ~/.my.cnf
    EOF

  tags = local.tags
}
output "app_instance_private_ip" {
  value = aws_instance.app_instance.private_ip
}