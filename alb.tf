resource "aws_lb" "alb" {
  name               = "timing-alb"
  internal           = var.internet
  load_balancer_type = "var.lb_type"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.subnet_ids
  idle_timeout = var.tiimeout

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}