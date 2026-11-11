
# Commute Planner - Infrastructure Automation

Infrastructure automation project demonstrating Infrastructure as Code (IaC) and configuration management using Terraform, Docker, and Ansible.

## Architecture

- WSL2 Ubuntu: Control environment
- Docker Desktop: Container runtime
- Terraform: Provisions Docker infrastructure
- Ansible: Configures the Ubuntu container
- Ubuntu 24.04: Infrastructure target

## Project Structure

```text
commute-track-b-infra/
├── ansible/
│   ├── inventory.ini
│   └── bootstrap.yml
├── main.tf
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

## Prerequisites

- Windows with WSL2
- Ubuntu distribution
- Docker Desktop with WSL integration
- Terraform
- Ansible Core
- community.docker Ansible collection

## Provision Infrastructure

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform fmt
terraform validate
```

Preview changes:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

## Configure Infrastructure

Run the Ansible playbook:

```bash
ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml
```

## Verify Deployment

Check Docker containers:

```bash
docker ps
```

Check installed packages:

```bash
docker exec commute-infra-target curl --version
docker exec commute-infra-target git --version
```

Check Ansible configuration:

```bash
docker exec commute-infra-target cat /etc/commute-infra-managed
```

## Terraform State

Terraform tracks provisioned resources in `terraform.tfstate`.

State files, provider directories, and sensitive variable files are excluded from Git.

## Cleanup

To remove Terraform-managed infrastructure:

```bash
terraform destroy
```

Review the destruction plan and confirm when prompted.
