resource "aws_launch_configuration" "my_launch_config1" {
  name = "web-server-launch-config1"
  image_id = "ami-0005e0cfe09cc9050" 
  instance_type = "t2.micro"
  key_name = "terraform-key"
  user_data = <<-EOF
               #!/bin/bash
               # Install and configure your web server here
               apt-get update
               apt-get install -y apache2
               sed -i 's/80/8080/' /etc/apache2/sites-available/000-default.conf
               service apache2 restart
             EOF

  lifecycle {
    create_before_destroy = true
  }
}
