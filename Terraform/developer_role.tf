resource "aws_iam_policy" "developer" {
  name        = "CloudSecure-DeveloperPolicy"
  description = "Custom policy for developer role with security safeguards"
  
  policy = file("${path.module}/policies/developer_policy.json")

  tags = merge(
    local.common_tags,
    {
      Name = "CloudSecure-DeveloperPolicy"
      Role = "developer"
    }
  )
}

resource "aws_iam_role" "developer" {
  name        = var.developer_role_name
  description = "Developer role for application deployment with safeguards"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_acccount_id}:user/Admin"
        }
        Action = "sts:AssumeRole"
        Condition = var.require_mfa ? {
          Bool = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        } : {}
      }
    ]
  })

  tags = merge(
    local.common_tags,
    {
      Name = var.developer_role_name
      Role = "Developer"
      Team = "Engineering"
    }
  )
}

resource "aws_iam_role_policy_attachment" "developer_policy" {
  role       = aws_iam_role.developer.name
  policy_arn = aws_iam_policy.developer.arn
}