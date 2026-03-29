resource "aws_instance" "web_server" {
  ami           = "ami-0f559c3642608c138" # Amazon Linux 2023 (Verify for your region)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Root Storage block
  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "interview server"
  }
}
