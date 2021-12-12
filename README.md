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

### Add IAM Account

https://console.aws.amazon.com/iamv2/home#/users

Add new user and get credential file

```bash
# Grab your KeyID and AccessKey
aws configure
```

if you need, add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` on your `~/.zshrc`

### [Optional] AWS Credentials

```bash
aws ec2 create-key-pair --key-name your-key-name --profile your-aws-account-name | python -c "import sys, json; print(json.load(sys.stdin)['KeyMaterial'])" > your-key-name.pem  && chmod 400 your-key-name.pem

cat your-key-name.pem
```

## Command

### Initial

```bash
terraform init
terraform fmt
terraform validate
```

### Apply

```bash
terraform apply
```

```json
// add variables.tf and use variable on main.tf or something
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "TerraformAppServerInstance"
}

variable "instance_type" {
  description = "Value of the type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

```bash
# with variablese
terraform apply -var "instance_name=my-instance" -var "instance_type=t2.micro"
```

### Check

```bash
terraform show
terraform state list
```

#### Inspect

```json
// Add output.tf
output "instance_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.app_server.id
}

output "instance_state" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.app_server.public_ip
}
```

```bash
terraform apply
terraform output
```

### Destroy

```bash
terraform destroy
```
