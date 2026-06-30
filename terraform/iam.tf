resource "aws_iam_role" "ec2_role" {
  name = "my-custom-role-devops-1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "custom-instance-1"
  role = aws_iam_role.ec2_role.name
}
