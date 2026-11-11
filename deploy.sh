
#!/usr/bin/env bash

set -euo pipefail

echo "======================================"
echo " Commute Planner Infrastructure Setup"
echo "======================================"

echo ""
echo "[1/4] Initializing Terraform..."
terraform init -input=false

echo ""
echo "[2/4] Validating Terraform..."
terraform validate

echo ""
echo "[3/4] Provisioning Docker infrastructure..."
terraform apply -auto-approve

echo ""
echo "[4/4] Configuring infrastructure with Ansible..."
ansible-playbook \
  -i ansible/inventory.ini \
  ansible/bootstrap.yml

echo ""
echo "Verifying container status..."
docker ps --filter "name=commute-infra-target"

echo ""
echo "Infrastructure deployment completed successfully!"
