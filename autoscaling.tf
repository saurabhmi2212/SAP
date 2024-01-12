resource "aws_launch_configuration" "my_launch_config" {
  name = "web-server-launch-config"
  image_id = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  user_data = <<-EOF
                #!/bin/bash
                # Install and configure your web server here
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "my_asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  launch_configuration = aws_launch_configuration.my_launch_config.id
  availability_zones = ["us-east-1a"]
}
