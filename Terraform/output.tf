output "admin_role_arn" {
  description = "ARN of the admin IAM role"
  value       = aws_iam_role.admin.arn
}

output "admin_role_name" {
  description = "Name of the admin IAM role"
  value       = aws_iam_role.admin.name
}

output "developer_role_arn" {
  description = "ARN of the developer IAM role"
  value       = aws_iam_role.developer.arn
}

output "developer_role_name" {
  description = "Name of the developer IAM role"
  value       = aws_iam_role.developer.name
}

output "developer_policy_arn" {
  description = "ARN of the developer custom policy"
  value       = aws_iam_policy.developer.arn
}

output "aws_account_id" {
  description = "Current AWS Account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "Current AWS Region"
  value       = data.aws_region.current.name
}

output "switch_role_url_admin" {
  description = "URL to switch to admin role in AWS Console"
  value       = "https://signin.aws.amazon.com/switchrole?roleName=${aws_iam_role.admin.name}&account=${data.aws_caller_identity.current.account_id}"
}

output "switch_role_url_developer" {
  description = "URL to switch to developer role in AWS Console"
  value       = "https://signin.aws.amazon.com/switchrole?roleName=${aws_iam_role.developer.name}&account=${data.aws_caller_identity.current.account_id}"
}