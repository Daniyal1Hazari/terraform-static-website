
resource "aws_instance" "web" {
  ami           = "ami-0a2f3ecf7b370b274"                      # Amazon Linux 2 (ap-south-1)
  instance_type = var.instance_type

  security_groups = [aws_security_group.web_sg.name]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "Terraform-Web-Server"
  }
}
