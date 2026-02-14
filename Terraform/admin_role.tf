resource "aws_iam_role" "admin"{                                                                                
  name        = var.admin_role_name
  description = "Admin role with full AWS access for DevOps team"

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
      Name = var.admin_role_name
      Role = "Admin"
      Team = "DevOps"
    }
  )
}

resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}