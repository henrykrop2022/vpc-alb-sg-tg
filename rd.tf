
resource "aws_db_subnet_group" "main" {
  name       = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.priv1.id,
    aws_subnet.priv2.id,
  ] 
  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "mysql_1" {
  allocated_storage      = 20
  engine                 = "mysql"                # Ensure this is correct
  engine_version         = "8.0"                 # Ensure this version is supported
  instance_class         = "db.t3.micro"
  db_name                = "rds_mydb_database"
  username               = "admin"
  password               = "password123"          # Use secrets management for production
  parameter_group_name   = "default.mysql8.0"    # Ensure the parameter group matches the engine version
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot    = true

  tags = {
    Name = "rds-mysql"
  }
}


 data "aws_availability_zones" "available" {}

# output "db_endpoint" {
#   value = aws_db_instance.mysql_1.endpoint
# }
