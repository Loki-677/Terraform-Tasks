Task-5: Multi-Environment AWS Infrastructure with Terraform Modules
Overview
This project provisions modular AWS infrastructure with Terraform for both development and production environments. It uses dedicated Terraform modules for VPC, EC2 instances, and S3 backend remote state management.

Features
Modular design for VPC, subnets, Internet Gateway, route tables

Parameterized EC2 module supporting custom instance maps

Remote state management with S3 backend using Terraform workspaces for environment isolation

Easy switching between dev and prod environments using Terraform workspaces

Project Structure
text
.
├── main.tf              # Main configuration wiring modules together
├── variables.tf         # Input variable definitions
├── outputs.tf           # Output definitions
├── dev.tfvars           # Input values for the dev environment
├── prod.tfvars          # Input values for the prod environment
├── modules/
│   ├── vpc/             # VPC module (networking resources)
│   └── ec2-instance/    # EC2 module (compute resources)
└── .gitignore           # Ensures no .terraform or provider binaries tracked
Usage
1. Initialize Terraform
The backend is configured to use a single S3 bucket with workspace-based state files.

text
terraform {
  backend "s3" {
    bucket       = "infra-tfstate-01"
    key          = "terraform.tfstate" # Workspace modifies this path automatically
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}
Initialize Terraform once:

bash
terraform init
2. Create and Switch Workspaces for Environments
Terraform workspaces isolate state within the same backend bucket:

bash
# Create and switch to dev workspace
terraform workspace new dev
terraform workspace select dev

# Apply dev environment
terraform apply -var-file=dev.tfvars
bash
# Create and switch to prod workspace
terraform workspace new prod
terraform workspace select prod

# Apply prod environment
terraform apply -var-file=prod.tfvars
Each workspace maintains its own remote state file:

For dev workspace, state stored at dev/terraform.tfstate

For prod workspace, state stored at prod/terraform.tfstate

3. Plan and Apply per Workspace
Run terraform plan and apply using the corresponding variable file while on the right workspace:

bash
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
Inputs
Variable	Type	Description
region	string	AWS region (e.g., us-east-2)
project	string	Project name prefix
vpc_cidr	string	VPC CIDR block
public_subnets	map	Map of public subnets specs
private_subnets	map	Map of private subnets specs
instances	map	EC2 instance definitions
key_pair_name	string	AWS key pair name
Outputs
Output	Description
vpc_id	VPC ID
public_subnets	IDs of public subnets
private_subnets	IDs of private subnets
instances	Instance IDs and IPs
Best Practices
Use workspaces for environment separation instead of multiple backend configs.

Don't commit .terraform or provider binaries to version control.

Always run terraform init if you switch workspaces or backend configs.

Manage variables explicitly with tfvars files per environment.

S3 Remote State
One S3 bucket stores all workspace states isolated by workspace name as subfolders:

text
infra-tfstate-01/
├── dev/
│   └── terraform.tfstate
└── prod/
    └── terraform.tfstate
Author
Loki

Created for Task-5 Internship, DevOps Project, 2025.

Consider using terraform-docs to automate README updates in the future.