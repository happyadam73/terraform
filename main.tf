resource "aws_instance" "MyEC2Instance" {

  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"

  tags = {

    name = "my first terraform ec2 instance"

  }

}
