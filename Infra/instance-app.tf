resource "aws_instance" "app_instance" {
  ami           = local.ubuntu_ami_id
  instance_type = "t3.micro"

  # Use a count loop to create 3 instances, one in each of the specified subnets
  subnet_id     = module.vpc.private_subnets[0]
  key_name      = aws_key_pair.my_keypair.key_name
  vpc_security_group_ids  = [aws_security_group.app_sg.id]


  # Tags and other instance configuration...
}