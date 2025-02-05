resource "aws_instance" "web" {
  ami                                  = "ami-0c614dee691cbbf37"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  instance_type                        = "t2.micro"
  key_name                             = "window_key"
  monitoring                           = false
  subnet_id                            = "subnet-0481d01fd33e9b1d0"
  vpc_security_group_ids      = ["sg-031de9dd9f18ac9b4"]
  tags = {
    Name = "terraform-Import"
  }  
}
