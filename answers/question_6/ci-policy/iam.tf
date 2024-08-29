# Ref https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html


resource "aws_iam_role" "main_role" {
  name               = local.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_user.user.arn
        }
      }
    ]
  })
}

resource "aws_iam_policy" "assume_role" {
  name        = local.policy_name
  description = "Policy to allow assuming the ${local.role_name} role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Resource = aws_iam_role.this.arn
      }
    ]
  })
}

resource "aws_iam_group" "main_group" {
  name = local.group_name
}

resource "aws_iam_group_policy_attachment" "assume_role" {
  group      = aws_iam_group.main_group.name
  policy_arn = aws_iam_policy.assume_role.arn
}

resource "aws_iam_user" "user" {
  name = local.user_name
}

resource "aws_iam_user_group_membership" "main" {
  user   = aws_iam_user.user.name
  groups = [aws_iam_group.main_group.name]
}
