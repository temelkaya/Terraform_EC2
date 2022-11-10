resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.ec2type
  key_name               = var.keypair
  subnet_id              = aws_subnet.publicsubnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("tools.sh")
  tags = {
    Name = var.ec2-tag-name
  }
}

resource "aws_launch_template" "launchtemplate" {
  name = var.lt-name
  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }
  image_id                             = var.ami
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.ec2type
  key_name                             = var.keypair
  network_interfaces {
    associate_public_ip_address = true
  }
  placement {
    availability_zone = var.az
  }
  vpc_security_group_ids = [aws_security_group.sg.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.lt-name
    }
  }
  user_data = filebase64("${path.module}/tools.sh")
}