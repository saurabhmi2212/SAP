resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for the web server"
  vpc_id      = "vpc-0d707b11f35d70f15" 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow incoming traffic from the world
  }
}

resource "aws_instance" "web_server1" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  user_data = <<-EOF
               #!/bin/bash
               # Install and configure your web server here
             EOF
}
