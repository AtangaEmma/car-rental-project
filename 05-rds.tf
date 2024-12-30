# Create a database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "${var.project_name}-${var.environment}-database-subnets"
  description = "subnets for database instance"

  subnet_ids = [
    aws_subnet.private_data_subnet_az1.id,
    aws_subnet.private_data_subnet_az2.id
  ]

  tags = {
    Name = "${var.project_name}-${var.environment}-database-subnets"
  }
}

# # Define MySQL Parameter Group for RDS
resource "aws_db_parameter_group" "mysql_parameter_group" {
  name        = "mysql-para-group"
  family      = "mysql8.0"
  description = "MySQL Parameter Group"

  parameter {
    name  = "max_connections"
    value = "200"
  }
}

resource "aws_db_instance" "dev_rds_db" {
  identifier              = "dev-rds-db"
  engine                  = "mysql"
  engine_version          = "8.0.36"
  instance_class          = "db.t3.medium"
  skip_final_snapshot     = true
  allocated_storage       = 20
  max_allocated_storage   = 100
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  multi_az                = true 
  username                = "admin"
  password                = "olusola123"
  db_name                 = "applicationdb"
  storage_encrypted       = true
  backup_retention_period = 7
  publicly_accessible     = true  # Add this to make the RDS instance publicly accessible
}
