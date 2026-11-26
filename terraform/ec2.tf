# Key pair
resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project_name}-key"
  public_key = file("~/.ssh/id_ed25519.pub")

  tags = {
    Name = "${var.project_name}-key"
  }
}

resource "aws_instance" "pipeline_instance" {
  ami = "ami-0a1a0c4fe286aaf02"
  instance_type = var.pipeline_instance_type
  availability_zone = "${var.aws_region}a"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.public_subnet1.id
  key_name = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  user_data = local.ec2_user_data_base

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-pipeline-instance"
  }
}

resource "aws_instance" "observability_instance" {
  ami = "ami-0a1a0c4fe286aaf02"
  instance_type = var.observability_instance_type
  availability_zone = "${var.aws_region}a"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.public_subnet1.id
  key_name = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  user_data = local.ec2_user_data_base

  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-observability-instance"
  }
}