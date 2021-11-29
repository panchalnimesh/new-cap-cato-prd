resource "aws_iam_role_policy" "Cato-vSocket-Policy" {
  name = "Cato-vSocket-Policy"
  role = aws_iam_role.Cato-vSocket-Role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateRoute",
          "ec2:DescribeRouteTables",
          "ec2:ReplaceRoute"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "Cato-vSocket-Role" {
  name = "Cato-vSocket-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        tags = {

        Name = "Cato-vSocket-Role"
        }
      },
    ]
  })
}