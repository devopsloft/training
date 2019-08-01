provider "aws" {
  region = "us-east-2"
}
data "aws_availability_zones" "all" {}
resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]
  min_size = 2
  max_size = 10

  load_balancers    = ["${aws_elb.example.name}"]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "${var.environment}-terraform-asg-example"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "instance" {
  name = "${var.environment}-terraform-example-instance"
  ingress {
    from_port   = "${var.web_port}"
    to_port     = "${var.web_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.web_port} &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}