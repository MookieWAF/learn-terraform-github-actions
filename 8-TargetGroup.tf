resource "aws_lb_target_group" "tacoTuesday_tg_80" {
  name        = "tacoTuesday-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tacoTuesday.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tacoTuesdayTargetGroup80"
    Service = "tacoTuesday"
    Owner   = "Chewbacca"
    Project = "tacoTuesday"
  }
}

resource "aws_lb_target_group" "tacoTuesday_tg_443" {
  name        = "tacoTuesdaytg443"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tacoTuesday.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tacoTuesday_tg_443"
    Service = "tacoTuesday"
    Owner   = "Chewbacca"
    Project = "tacoTuesday"
  }
}
