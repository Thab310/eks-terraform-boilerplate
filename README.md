# EKS Terraform Boilerplate


Production-grade EKS infrastructure using terraform

## Features
- ✅ Multi-AZ EKS cluster with managed nodegroups
- ✅ Pod Identity for AWS service access
- ✅ RDS PostgreSQL with automated backups
- ✅ S3 bucketswith lifecycle policies
- ✅ VPC with public, private, and database subnets
- ✅ Platform addons (ALB Controller, Cluster Autoscaler)
- ✅ Complete security group configuration
- ✅ CloudWatch monitoring and logging

## Prequisites
- Terraform >= 1.5.0
- AWS CLI configured
- kubectl
- helm

## Quick Start
1. Clone repository
2. Copy terraform.tfvars.example to terraform.tfvars
3. Run ./scripts/init.sh prod
4. Run ./scripts/plan.sh prod
5. Run ./scripts/apply.sh prod

## Architecture

See docs/architecture.md

## Security

See docs/security.md
