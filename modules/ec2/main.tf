data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

}

resource "aws_instance" "web" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.sg_id]

  tags = {

    Name = var.instance_name

  }

}