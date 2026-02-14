# Quick Start Guide

## Prerequisites
- AWS Account (Free Tier)
- AWS CLI installed and configured
- Terraform >= 1.0 installed
- MFA device (Google Authenticator app)

---

## Setup (15 minutes)

### Step 1: Clone Repository
```bash
git clone https://github.com/Abhikarthik3104/CloudSecure-IAM-Project.git
cd CloudSecure-IAM-Project
```

### Step 2: Configure AWS CLI
```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: us-east-1
# Default output: json
```

### Step 3: Deploy Infrastructure
```bash
cd Terraform
terraform init
terraform plan
terraform apply
# Type: yes when prompted
```

### Step 4: Create IAM Admin User
1. Go to AWS Console → IAM → Users
2. Click "Create user"
3. Username: `admin-user`
4. Enable console access
5. Attach policy: `AdministratorAccess`
6. Enable MFA (Google Authenticator)

### Step 5: Test Role Switching
1. Sign out of root account
2. Sign in as `admin-user` with MFA
3. Click your name → Switch Role
4. Enter:
   - Account ID: `103976430153`
   - Role: `CloudSecure-Developer`
5. Click Switch Role ✅

---

## Role Details

### Cloud-Secure-Admin
- **Purpose:** Full AWS administration
- **Use for:** Infrastructure management, user creation
- **Switch Role name:** `Cloud-Secure-Admin`

### CloudSecure-Developer  
- **Purpose:** Application deployment
- **Use for:** EC2, Lambda, S3 (dev-* only)
- **Switch Role name:** `CloudSecure-Developer`

---

## Testing Security Controls

### Test Admin Role:
```bash
# After switching to Admin role
# Try accessing Billing → Should work ✅
# Try creating IAM user → Should work ✅
```

### Test Developer Role:
```bash
# After switching to Developer role
# Try launching EC2 → Should work ✅
# Try accessing Billing → Should be DENIED ❌
# Try creating IAM user → Should be DENIED ❌
# Try deleting S3 bucket → Should be DENIED ❌
```

---

## Troubleshooting

### Issue: "Cannot switch roles"
**Solution:** Make sure you're using IAM user (admin-user), NOT root account

### Issue: "MFA required error"  
**Solution:** Enable MFA on your IAM user account first

### Issue: "Access Denied on role switch"
**Solution:** Check trust policy allows your account ID

### Issue: Terraform errors
```bash
# Re-initialize
terraform init -upgrade
terraform plan
```

---

## Clean Up
```bash
# Destroy all Terraform resources
cd Terraform
terraform destroy
# Type: yes
```

---

## Security Reminders
- ⚠️ Never use root account for daily operations
- ✅ Always enable MFA on all IAM users
- ✅ Use roles for temporary access
- ✅ Review permissions regularly
- ✅ Never commit terraform.tfstate to Git

---

## Support
**GitHub:** [Abhikarthik3104](https://github.com/Abhikarthik3104)
```