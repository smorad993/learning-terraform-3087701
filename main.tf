data "aws_ami" "app_ami" {
  most_recent = true
  owner       =["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"    #change because of free account t3 to t2

  tags = {
    Name = "HelloWorld"
  }
}
