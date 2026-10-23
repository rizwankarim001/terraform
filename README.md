# Terraform AWS EC2 Example

This project uses Terraform and the AWS provider to create an EC2 instance in `us-east-1`. The instance is defined in the `modules/ec2_instance` child module, and Terraform state is configured to use an S3 backend.

## Project structure

```text
.
├── backend.tf
├── main.tf
├── variable.tf
├── terraform.tfvars        # Local variable values; do not commit
└── modules/
    └── ec2_instance/
        ├── main.tf
        ├── output.tf
        ├── providers.tf
        └── variable.tf
```

## Prerequisites

- Terraform 1.10 or later
- AWS credentials configured for your environment
- An S3 bucket matching the bucket name configured in `backend.tf`
- AWS permissions to manage EC2 resources and access the S3 state bucket

Do not put AWS credentials in Terraform files or commit them to GitHub.

## Configure variables

Create a local `terraform.tfvars` file in the project root:

```hcl
ami_id        = "your-ami-id"
instance_type = "t3.micro"
```

Choose an AMI that is available in `us-east-1`. The root module passes these values to the EC2 child module.

## Initialize and deploy

Run these commands from the project root:

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

Review the plan before confirming `terraform apply`.

## View outputs

```bash
terraform output
```

## Remove the infrastructure

```bash
terraform destroy
```

This deletes the resources managed by the current Terraform state. Review the proposed changes before confirming.

## State and sensitive files

The S3 backend stores Terraform state remotely. Keep the state bucket private and do not commit state files, `terraform.tfvars`, or the `.terraform/` directory. The `.terraform.lock.hcl` provider lock file should generally be committed so the project uses consistent provider versions.
