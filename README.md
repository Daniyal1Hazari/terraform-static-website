# Cloud Application Deployment using Terraform & GitHub Actions

## Project Overview

This project demonstrates Infrastructure as Code (IaC) and CI/CD best practices by deploying a simple web application on AWS using Terraform and GitHub Actions.

The infrastructure is provisioned using Terraform, while GitHub Actions automates the deployment whenever changes are pushed to the GitHub repository.

---

# Technology Stack

| Component | Technology |
|-----------|------------|
| Cloud Provider | AWS |
| Infrastructure as Code (IaC) | Terraform |
| Compute | Amazon EC2 |
| Operating System | Amazon Linux 2 (Free Tier Eligible) |
| Web Server | Nginx |
| Application | Static Website (HTML, CSS, JavaScript) |
| CI/CD | GitHub Actions |
| Security | AWS IAM Role & Security Group |
| Development Environment | WSL (Ubuntu) on Windows |
| Version Control | Git & GitHub |
---





# Infrastructure Components

The Terraform configuration provisions the following AWS resources:

- EC2 Instance
- Security Group
- IAM Role
- IAM Instance Profile
- HTTP Access (Port 80)

---

# IAM Configuration

A basic IAM Role is attached to the EC2 instance.

Attached policy:

- AmazonSSMManagedInstanceCore
  Using IAM Roles avoids storing AWS credentials directly on the EC2 instance thus enhancing security.
---

# Security

Security Group Rules

| Port | Protocol | Purpose |
|------|----------|----------|
| 22 | TCP | SSH | For Linux/Ubuntu access
| 80 | TCP | HTTP | For web access


---

# CI/CD Pipeline

GitHub Actions automates the deployment process.




# Trade-offs and design decisions Considered

Used EC2 as it is Simpler and cost-effective setup.
Deployed NGINX static website as it is Lightweight.
Configured GitHub actions as CI/CD  for Automation and repeatability as it is open-source.
Provisioned Terraform as IaC for seamless code repeatability as it is open-souce and support every cloud provider.



# Cost Awareness

This solution is designed to stay within the AWS Free Tier whenever possible.

Resources Used:

| Resource | Estimated Monthly Cost |
|----------|-------------------------|
| t2.micro | Free Tier Eligible |
| IAM | Free |
| Security Group | Free |
| GitHub Actions | Free (within usage limits) |
| Terraform | Free |

Estimated monthly cost outside the Free Tier:

Approximately $8–12 USD/month

To minimize costs:

- Stop the EC2 instance when not in use.
- Destroy infrastructure after testing.



# Deliverables Checklist

- ✅ Terraform Infrastructure Code
- ✅ AWS EC2 Deployment
- ✅ Public HTTP Access
- ✅ IAM Role Attached
- ✅ GitHub Actions CI/CD Pipeline
- ✅ Architecture Diagram
- ✅ Well-Documented README
- ✅ Design Decisions
- ✅ Trade-offs
- ✅ Cost Awareness


# Conclusion

This project demonstrates an end-to-end cloud deployment workflow using AWS, Terraform, IAM, and GitHub Actions. It follows Infrastructure as Code (IaC) principles, automates deployments through CI/CD, and incorporates security best practices using IAM roles. The architecture is simple, cost-effective, and scalable, making it a strong foundation for deploying production-ready cloud applications.
