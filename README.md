
# Multi Environment Terraform Architecture

A structured Terraform project demonstrating how to design and manage **multi-environment infrastructure** using reusable modules and environment isolation.

---

# 1. Project Overview

This repository demonstrates a **production-style Terraform architecture** designed to manage infrastructure across multiple environments such as:

- Development
- Testing
- Production

In real-world systems, maintaining separate environments is essential for **safe software delivery** and **operational stability**.

Typical workflows require:

- Developers to experiment in a **development environment**
- QA teams to validate features in a **testing environment**
- Stable workloads to run in **production**

Without proper environment separation, changes in development could directly affect production systems.

This project implements a **clean Terraform architecture** that:

- Promotes reusable infrastructure modules
- Ensures environment isolation
- Enables centralized state management
- Supports scalable infrastructure growth

The structure follows common infrastructure practices used in **DevOps and platform engineering teams**.

---

# 2. Architecture Overview

The repository is designed around two key Terraform design principles:

1. **Reusable Modules**
2. **Environment-Specific Deployments**


Environment directories define how those modules are deployed in specific environments.

The architecture follows this model:

```

Modules (Reusable Infrastructure)
↓
Environment Configuration
↓
Terraform State (Remote Backend)

```

Each environment independently calls the required modules while maintaining **separate Terraform state files**.

This ensures that:

- Infrastructure changes remain isolated
- Environments can evolve independently
- Production infrastructure remains protected

---

# 3. Repository Structure

```

.
├── modules
│   ├── vpc
│   ├── ec2
│   ├── s3
│   └── dynamodb
│
├── env
│   ├── bootstrap
│   ├── dev
│   ├── testing
│   └── prod
│
├── provider.tf
└── terraform.tf

```

## modules/

This directory contains **reusable Terraform modules**.

Each module encapsulates a specific infrastructure component.

### modules/vpc
Defines network infrastructure including:

- VPC
- Subnets
- Routing configuration

### modules/ec2
Creates compute instances including:

- EC2 instance configuration
- Security groups
- Instance metadata

### modules/s3
Defines S3 bucket resources used for:

- Storage
- Terraform remote state

### modules/dynamodb
Defines DynamoDB tables used for:

- Terraform state locking
- Preventing concurrent Terraform operations

---

## env/

This directory contains **environment-specific configurations**.

Each environment calls Terraform modules with environment-specific variables.

### env/bootstrap

This environment initializes **backend infrastructure** required for Terraform itself.

It creates:

- S3 bucket for remote state
- DynamoDB table for state locking

This must be deployed before other environments.

---

### env/dev

Development environment infrastructure.

Used for:

- Developer experimentation
- Feature testing
- Early-stage deployments

Typically uses smaller and cost-efficient resources.

---

### env/testing

Testing environment used for:

- Integration testing
- QA validation
- Pre-production verification

Infrastructure here usually mirrors production more closely.

---

### env/prod

Production environment used for:

- Live workloads
- Stable application deployments

This environment should be treated as **immutable and highly controlled**.

---

## provider.tf

Defines the Terraform provider configuration.

Typically includes:

- AWS provider
- Region configuration
- Authentication settings

Example responsibilities:

- Connecting Terraform to AWS
- Defining provider versions

---

## terraform.tf

Contains global Terraform configuration such as:

- Terraform version constraints
- Backend configuration
- Shared settings used across environments

---

# 4. Key Concepts Implemented

## Terraform Modules

Modules allow infrastructure code to be **reusable and maintainable**.

Instead of rewriting infrastructure logic for each environment, modules encapsulate common infrastructure patterns.

Benefits include:

- Code reuse
- Reduced duplication
- Easier maintenance

---

## Multi-Environment Infrastructure

Separate directories represent different environments:

- dev
- testing
- prod

Each environment maintains **independent Terraform state**.

This prevents infrastructure changes in one environment from impacting others.

---

## Remote State with S3

Terraform state files are stored remotely in **Amazon S3**.

Remote state provides:

- Centralized infrastructure state
- Team collaboration support
- Backup and durability

---

## State Locking with DynamoDB

Terraform uses **DynamoDB state locking** to prevent multiple users from modifying infrastructure simultaneously.

This prevents:

- State corruption
- Race conditions
- Conflicting infrastructure updates

---

## Bootstrapping Backend Infrastructure

Terraform requires the backend storage (S3 and DynamoDB) to exist **before remote state can be configured**.

For this reason, a **bootstrap environment** is used to create the backend infrastructure first.

---

## Environment Tagging

Resources are tagged with environment-specific labels such as:

```

Environment = dev
Environment = testing
Environment = prod

```

Tagging improves:

- Resource organization
- Cost tracking
- Operational visibility

---

## Network Isolation with CIDR Ranges

Each environment uses a **separate CIDR range**.

Example:

```

Dev     → 10.0.0.0/16
Testing → 10.20.0.0/16
Prod    → 10.30.0.0/16

````

This ensures environments remain **network-isolated** and prevents accidental overlap.

---

# 5. Prerequisites

Before running this project, ensure the following tools are installed:

- **Terraform**
- **AWS CLI**
- **Git**

You must also have:

- An **AWS account**
- IAM permissions to create infrastructure resources

---

# 6. Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/multi-env-terraform-architecture.git
````

Navigate into the project directory:

```bash
cd multi-env-terraform-architecture
```

Ensure your AWS credentials are configured:

```bash
aws configure
```

---

# 7. Bootstrapping Infrastructure

Terraform remote backends require infrastructure to exist before they can be used.

Therefore, the **bootstrap environment** must be deployed first.

This environment creates:

* S3 bucket for storing Terraform state
* DynamoDB table for state locking

Navigate to the bootstrap directory:

```bash
cd env/bootstrap
```

Run Terraform commands to create backend infrastructure.

Once created, other environments can safely use the remote backend.

---

# 8. Running the Infrastructure

Terraform workflows typically follow four core commands.

### Initialize Terraform

```bash
terraform init
```

Downloads provider plugins and initializes the backend configuration.

---

### Validate Configuration

```bash
terraform validate
```

Checks Terraform configuration files for syntax and structural correctness.

---

### Generate Execution Plan

```bash
terraform plan
```

Shows the changes Terraform will apply to infrastructure before making modifications.

---

### Apply Infrastructure Changes

```bash
terraform apply
```

Creates or updates infrastructure resources based on the Terraform configuration.

---

# 9. Deploying Each Environment

Each environment can be deployed independently.

Example for the development environment:

```bash
cd env/dev
terraform init
terraform plan
terraform apply
```

Example for the testing environment:

```bash
cd env/testing
terraform init
terraform plan
terraform apply
```

Example for the production environment:

```bash
cd env/prod
terraform init
terraform plan
terraform apply
```

Each environment maintains **separate infrastructure and state files**.

---

# 10. Terraform Outputs

Modules expose outputs that provide important infrastructure information.

Typical outputs include:

* **VPC ID**
* **Public Subnet IDs**
* **EC2 Public IP Address**
* **S3 Bucket Name**
* **DynamoDB Table Name**

Outputs allow other modules or systems to reference infrastructure resources.

Example usage:

```
terraform output
```

---

# 11. Destroying Infrastructure

To remove infrastructure resources safely, run:

```bash
terraform destroy
```

Terraform will display a plan showing which resources will be deleted.

After confirmation, Terraform removes the infrastructure defined in that environment.

It is recommended to run destroy commands **only in the intended environment directory** to avoid accidental deletion of other environments.

---

# Summary

This repository demonstrates a **structured Terraform architecture** designed for real-world infrastructure management.

Key goals include:

* Environment isolation
* Reusable modules
* Centralized Terraform state
* Safe infrastructure lifecycle management

This structure can serve as a **foundation for scalable infrastructure deployments** in cloud environments.

```
```
