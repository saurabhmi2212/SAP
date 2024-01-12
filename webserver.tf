resource "aws_instance" "web_server" {
  ami = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  user_data = <<-EOF
                #!/bin/bash
                # Install and configure your web server here
              EOF
  # Add other instance configurations
}
