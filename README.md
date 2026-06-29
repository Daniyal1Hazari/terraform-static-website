
This repository contains the terraform code, architecture workflow diagram, GitHub actions workflow and the static website code to be deployed.

** Design Decisions **
Implemented Terraform with GitHub Actions CI/CD pipeline to fully automate infrastructure provisioning and deployment, ensuring consistency using terraform as IaC, security using IAM and repeatability using GitHub CI/CD.
Used AWS EC2 with static Nginx and User Data script to host and automatically configure website on a VM.

** Trade-offs Considered **
Chose EC2 over serverless (S3 + CloudFront +Lambda ) to fulfill the VM-based deployment requirement, even though serverless is simpler and more scalable.
Used a single-instance, fully automated infrastructure using Terraform instead of manually creating multiple resources , ensuring simplicity and automation over high availability and manual approval safety.

** Cost Awareness **
Used AWS Free Tier eligible resources (t2.micro/t3.micro) and avoided additional services like Load Balancer, RDS, or NAT Gateway to keep costs minimal.
Designed a smooth, secure, reliable and minimal single-VM architecture instead of creating multiple resources to optimize the cost and meet the requirements as well. Neglected creating separate VPC's, Internet Gateways or other infrastructure resources.

