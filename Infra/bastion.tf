resource "aws_instance" "bastion" {
  ami           = var.ubuntu_ami_id
  instance_type = "t3.micro"
  
  # Create the instance in one of the private subnets for bastion
  subnet_id     = module.vpc.public_subnets[0]  # Adjust as needed
  key_name      = aws_key_pair.my_keypair.key_name
  vpc_security_group_ids  = [aws_security_group.bastion_sg.id]

  # Tags and other instance configuration...
  tags = local.tags

}
output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}
