variable "aws_region"{
    description = "AWS region where resources will be created"
    type = string 
    default = "us-east-1"
}

variable "project_name"{
    description = "Project name used for tagging and naming resources"
    type = string 
    default = "CloudSecure-IAM"
}

variable "environment"{
    description = "Environment (dev, staging , prod)"
    type = string
    default = "dev"
}

variable "aws_acccount_id"{
    description = "AWS Account ID for trust policies"
    type = string 
    default = "103976430153"
}

variable "admin_role_name"{
    description = "Name of the admin IAM role "
    type = string
    default = "Cloud-Secure-Admin"
}

variable "require_mfa"{
    description = "Require MFA for role assumption"
    type = bool 
    default = false
}

variable "developer_role_name"{
    description = "Name of the developer IAM role"
    type = string 
    default = "CloudSecure-Developer"
}