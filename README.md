# Why Terraform?

Infrastructure as code is a great way to build and manage your infrastructure.
Terraform is a tool for building and managing infrastructure as code.
It's good for you and me and others.

## Installation

```bash
brew install tfenv
tfenv install 1.1.0
tfenv use 1.1.0
```

### AWS Credentials

```bash
aws ec2 create-key-pair --key-name your-key-name --profile your-aws-account-name | python -c "import sys, json; print(json.load(sys.stdin)['KeyMaterial'])" > your-key-name.pem  && chmod 400 your-key-name.pem

cat your-key-name.pem
# Grab your KeyID and AccessKey
aws configure
```

## Command

```bash
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state liste
```
