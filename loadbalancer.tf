resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-04134dfb094382573"]  
  subnets            = ["subnet-05323abb4db50d424","subnet-034a685c545fa667e"]  
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 8080  
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-0d707b11f35d70f15" 
}
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "my_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = "i-0921f567f7bcf3da4" 
}
