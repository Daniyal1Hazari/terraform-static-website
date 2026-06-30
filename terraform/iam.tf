resource "aws_iam_role" "ec2_role" {
  name = "ec2-ssm-role-v2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile-v2"
  role = aws_iam_role.ec2_role.name
}
