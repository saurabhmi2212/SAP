resource "aws_iam_user" "web_restart_user" {
  name = "web_restart_user"
}

resource "aws_iam_user_policy" "restart_web_server_policy" {
  name   = "restart_web_server_policy"
  user   = aws_iam_user.web_restart_user.name

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "ec2:RebootInstances",
          "Resource": "*"
        }
      ]
    }
  EOF
}
