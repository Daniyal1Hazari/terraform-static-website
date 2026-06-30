# Cloud Application Deployment using Terraform & GitHub Actions

## Project Overview

This project demonstrates Infrastructure as Code (IaC) and CI/CD best practices by deploying a simple web application on AWS using Terraform and GitHub Actions.

The infrastructure is provisioned using Terraform, while GitHub Actions automates the deployment whenever changes are pushed to the GitHub repository.

---

# Technology Stack

| Component | Technology |
|----------|-------------|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| Compute | EC2 Instance |
| Operating System | Amazon Linux 2023 (free-tier)|
| Application | Static NGINX |
| CI/CD | GitHub Actions |
| Security | IAM Role, Security Groups |
| Web Server | Nginx |

---

# Architecture

Developer
   │
   ▼
GitHub Repository
   │ (git push)
   ▼
GitHub Actions CI/CD Pipeline
   │
   ├── Terraform Init
   ├── Terraform Plan
   ├── Terraform Apply
   │
   ▼
AWS Cloud
   │
   ├── EC2 Instance (Ubuntu)
   ├── Security Group (HTTP/SSH access)
   ├── IAM Role (SSM/EC2 permissions)
   │
   ▼
Nginx Web Server
   │
   ▼
Static Website (HTML/CSS/JS)
   │
   ▼
Public HTTP Access

# Project Structure

# Worflow diagram
cloud-app-deployment/
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── templates/
│
├── terraform/
│   ├── provider.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── iam.tf
│   └── security_group.tf
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── architecture.png
└── README.md
```

---

# Infrastructure Components

The Terraform configuration provisions the following AWS resources:

- EC2 Instance
- Security Group
- IAM Role
- IAM Instance Profile
- Public Elastic IP (Optional)
- SSH Access
- HTTP Access (Port 80)

---

# IAM Configuration

A basic IAM Role is attached to the EC2 instance.

Example policies:

- AmazonSSMManagedInstanceCore
- CloudWatchAgentServerPolicy (Optional)

Using IAM Roles avoids storing AWS credentials directly on the EC2 instance.

---

# Security

Security Group Rules

| Port | Protocol | Purpose |
|------|----------|----------|
| 22 | TCP | SSH |
| 80 | TCP | HTTP |

All other inbound traffic is blocked.

---

# CI/CD Pipeline

GitHub Actions automates the deployment process.

Workflow:

```text
Developer Pushes Code
        │
        ▼
GitHub Actions Triggered
        │
Install Dependencies
        │
Copy Files to EC2
        │
SSH into EC2
        │
Restart Flask Service
        │
Deployment Successful
```

---

# Deployment Steps

## Step 1: Clone Repository

```bash
git clone https://github.com/yourusername/cloud-app-deployment.git
cd cloud-app-deployment
```

---

## Step 2: Configure AWS Credentials

```bash
aws configure
```

Provide:

- AWS Access Key
- AWS Secret Key
- Region
- Output Format

---

## Step 3: Initialize Terraform

```bash
cd terraform

terraform init
```

---

## Step 4: Validate Configuration

```bash
terraform validate
```

---

## Step 5: Preview Changes

```bash
terraform plan
```

---

## Step 6: Provision Infrastructure

```bash
terraform apply
```

Confirm by typing:

```text
yes
```

Terraform creates the complete infrastructure.

---

## Step 7: Configure GitHub Secrets

Add the following repository secrets:

| Secret | Description |
|---------|-------------|
| EC2_HOST | EC2 Public IP |
| EC2_USER | ubuntu |
| SSH_PRIVATE_KEY | Contents of PEM key |

---

## Step 8: Deploy Application

Push your changes to GitHub.

```bash
git add .
git commit -m "Deploy application"
git push origin main
```

GitHub Actions will automatically:

- Install dependencies
- Connect to EC2
- Copy application files
- Restart the application

---

# Access the Application

Open your browser:

```
http://<EC2-PUBLIC-IP>
```

Example Output:

```
Hello from AWS Cloud!
```

---

# Design Decisions

### 1. Terraform

Terraform was selected because:

- Infrastructure as Code
- Reusable infrastructure
- Easy rollback
- Version controlled
- Multi-cloud support

### 2. EC2

EC2 was chosen because:

- Simple VM deployment
- Full operating system access
- Suitable for small applications
- Meets assessment requirements

### 3. GitHub Actions

GitHub Actions provides:

- Native GitHub integration
- Automated deployments
- Free usage for public repositories
- YAML-based workflows

### 4. IAM Role

IAM Roles eliminate the need for storing AWS credentials inside the server, improving security.

---

# Trade-offs Considered

| Option | Selected | Reason |
|---------|----------|--------|
| EC2 vs ECS | EC2 | Simpler setup |
| Flask vs Node.js | Flask | Lightweight and easy to deploy |
| Manual Deployment vs CI/CD | CI/CD | Automation and repeatability |
| Docker | Not Used | Outside assessment scope |
| Auto Scaling | Not Implemented | Small demo application |

---

# Cost Awareness

This solution is designed to stay within the AWS Free Tier whenever possible.

Resources Used:

| Resource | Estimated Monthly Cost |
|----------|-------------------------|
| t2.micro / t3.micro EC2 | Free Tier Eligible |
| IAM | Free |
| Security Group | Free |
| GitHub Actions | Free (within usage limits) |
| Terraform | Free |

Estimated monthly cost outside the Free Tier:

```
Approximately $8–12 USD/month
```

To minimize costs:

- Stop the EC2 instance when not in use.
- Destroy infrastructure after testing.

```bash
terraform destroy
```

---

# Testing

Validate Terraform:

```bash
terraform validate
```

Format Terraform:

```bash
terraform fmt
```

Review Infrastructure:

```bash
terraform plan
```

Verify Deployment:

```
http://<EC2-PUBLIC-IP>
```

Monitor GitHub Actions:

- Open the **Actions** tab in your GitHub repository.
- Ensure the deployment workflow completes successfully.

---

# Cleanup

Destroy all infrastructure when finished:

```bash
terraform destroy
```

This removes all AWS resources and prevents unnecessary charges.

---

# Future Improvements

Possible enhancements include:

- HTTPS using Let's Encrypt
- Docker containerization
- AWS Application Load Balancer
- Auto Scaling Group
- CloudWatch Monitoring
- Terraform Remote State (S3 + DynamoDB)
- AWS Secrets Manager
- Blue/Green Deployment Strategy

---

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

---

# Conclusion

This project demonstrates an end-to-end cloud deployment workflow using AWS, Terraform, IAM, and GitHub Actions. It follows Infrastructure as Code (IaC) principles, automates deployments through CI/CD, and incorporates security best practices using IAM roles. The architecture is simple, cost-effective, and scalable, making it a strong foundation for deploying production-ready cloud applications.
