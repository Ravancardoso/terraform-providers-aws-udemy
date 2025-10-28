resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group-terraform"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  tags = {
    Name = "db-subnet-group-terraform"
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "rds-terraform"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = "mydb"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true

  tags = {
    Name = "rds-terraform"
    Value = "DEV"
  }
}
