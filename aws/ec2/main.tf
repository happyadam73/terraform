resource "aws_instance" "ec2_instance" {

  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type

  tags = {

    name = var.instance_name

  }

}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("./id_rsa.pub")
}
