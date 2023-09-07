resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Security group for Bastion host"
  vpc_id      = module.vpc.vpc_id

  # Inbound rule for SSH access only from your IP address (replace with your IP)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your IP address
  }

  # Outbound rule allowing all traffic (for the Bastion host to communicate with App and RDS)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags, if needed
  tags = local.tags

}
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Security group for App instance"
  vpc_id      = module.vpc.vpc_id

  # Inbound rule allowing SSH traffic from the Bastion host
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  # Outbound rule allowing all traffic (for the App instance to communicate with RDS)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags, if needed
  tags = local.tags

}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = module.vpc.vpc_id

  # Inbound rule allowing MySQL traffic from the App instance (adjust for your RDS type)
  ingress {
    from_port   = 3306  # Assuming MySQL
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  # Outbound rule allowing all egress traffic (modify as needed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags, if needed
  tags = local.tags

}
