Multi-Environment Terraform Infrastructure

This repository demonstrates a modular Terraform Infrastructure as Code (IaC) architecture designed to manage cloud infrastructure across multiple environments.

The project separates reusable infrastructure modules from environment-specific configurations, allowing the same infrastructure logic to be reused for development, testing, and production environments.

The objective is to follow best practices for scalable infrastructure management using Terraform.

Architecture

The infrastructure is organised using a module-based architecture.

Reusable infrastructure components are defined inside the modules directory, while environment configurations are maintained inside the env directory.

Each environment calls the modules with its own configuration values.

modules → reusable infrastructure logic
env     → environment specific configuration
Repository Structure
.
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── s3/
│   └── dynamoDB/
│
├── env/
│   ├── dev/
│   ├── testing/
│   └── prod/
│
├── provider.tf
└── terraform.tf
Modules

Each module represents a reusable infrastructure component:

Module	Description
vpc	Creates VPC and networking resources
ec2	Launches compute instances
s3	Creates S3 buckets
dynamoDB	Creates DynamoDB table for Terraform state locking
Backend Configuration

Each environment configures a remote Terraform backend using:

S3 for storing Terraform state

DynamoDB for state locking

Example backend configuration:

terraform {
  backend "s3" {
    bucket         = "<environment>-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "<environment>-dynamodb-table"
  }
}

This ensures that infrastructure state is stored remotely and protected from concurrent modifications.

Requirements

The following tools must be installed before running this project:

Terraform

AWS CLI

Git

Installation
Install Terraform

MacOS

brew install terraform

Linux

sudo apt install terraform

Verify installation

terraform -version
Install AWS CLI

MacOS

brew install awscli

Linux

sudo apt install awscli

Verify installation

aws --version
Configure AWS Credentials

Terraform requires valid AWS credentials.

Configure credentials using:

aws configure

You will be prompted to provide:

AWS Access Key
AWS Secret Access Key
Default region
Output format

Ensure the IAM user has permissions for:

EC2

VPC

S3

DynamoDB

Usage

Navigate to the environment directory.

Example:

cd env/dev
Initialize Terraform
terraform init
Validate Configuration
terraform validate
Preview Infrastructure Changes
terraform plan
Apply Infrastructure
terraform apply

Terraform will display the execution plan before provisioning infrastructure.

Destroy Infrastructure

To remove created resources:

terraform destroy
Key Concepts Demonstrated

Terraform module architecture

Multi-environment infrastructure

Remote state management

State locking with DynamoDB

Reusable infrastructure components

Infrastructure isolation between environments

Future Improvements

Potential improvements for this project:

CI/CD pipeline integration

Automated infrastructure validation

Monitoring and logging integration

Policy enforcement with Terraform

Security scanning for infrastructure code

Author

Arpanel Franklin
B.Tech Computer Science Engineering (DevOps Specialisation)