# data "aws_ami" "amazon_linux" {

#   most_recent = true

#   owners = ["amazon"]

# }

# resource "aws_instance" "web" {

#   ami = data.aws_ami.amazon_linux.id

#   instance_type = var.instance_type

#   subnet_id = var.subnet_id

#   vpc_security_group_ids = [var.sg_id]

#   tags = {

#     Name = var.instance_name

#   }

# }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type =  var.instance_type

     subnet_id = var.subnet_id

   vpc_security_group_ids = [var.sg_id]

  tags = {
    Name =  var.instance_name
  }
}