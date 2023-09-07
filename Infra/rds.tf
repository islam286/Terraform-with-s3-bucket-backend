resource "aws_db_subnet_group" "example" {
  name       = "example-subnet-group"
  subnet_ids = module.vpc.database_subnets # Use your VPC module's output for database subnets
}


resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name  = aws_db_subnet_group.example.name

  tags = local.tags

}
output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}
