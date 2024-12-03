# Three-Tier Infra Using AWS+terraform+jenkins+git

# Discribtion
This project implements a robust, secure, and scalable three-tier application architecture on AWS, adhering to AWS best practices. The infrastructure is provisioned using Terraform and is fully automated with a Jenkins CI/CD pipeline. The setup is version-controlled using GitHub, ensuring streamlined deployment and environment management.

# Project Overview
The client required a reliable infrastructure for hosting a three-tier application with the following objectives:

Scalability and high availability.
Secure communication between tiers.
This solution was designed and deployed to meet those requirements using cutting-edge DevOps tools and AWS services.

# Tech Stack & Tools
AWS Cloud: Hosting infrastructure and services.

Terraform: Infrastructure as Code (IaC) for provisioning and managing resources.

Jenkins: CI/CD pipeline automation.

GitHub: Version control and collaboration.

EC2: Frontend and backend instances

# Deployment Strategy
The project employs a branching strategy to manage environments efficiently:

# Branches:
dev: For development environments.

prod: For production environments.

feature-dev: For testing new features in the development environment.

feature-prod: For testing features before production release.

# Pipeline Workflow:
Pull: Jenkins fetches the Terraform code from the respective branch on GitHub.

Test: Runs terraform plan to validate infrastructure configurations.

Deploy: Executes terraform apply to provision or update resources.

## Project Architechture
![image](https://github.com/user-attachments/assets/84d01125-bbe0-4569-93fe-a4627fbc94bd)




# GIT Commands 
For creating new branch - 
```bash
git checkout -b <branch-name> (locally)
```

For push created branch - 
```bash
git push -u origin <branch-name> (remote)
```

For delete branch in locally 
```bash
git branch -d <branch-name>
```

For delete branch in remote
```bash
git push origin --delete <branch-name>
```
