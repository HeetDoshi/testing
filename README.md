# End-to-End Web Deployment with CI/CD and Monitoring

##  Overview
This repository contains a containerizing and deploying a custom HTML website. It provisions AWS using Terraform, automates the Docker image build and deployment via a Jenkins CI/CD pipeline, and establishes comprehensive system monitoring using Prometheus and Grafana.

##  Architecture & Workflow
1. **Infrastructure as Code (IaC):** Terraform provisions a custom AWS VPC, Public Subnet, Internet Gateway, Security Groups, and an EC2 instance.
2. **Containerization:** A Dockerfile packages a custom HTML website into a lightweight Nginx container.
3. **CI/CD Pipeline:** A Declarative Jenkins Pipeline (`Jenkinsfile`) automates the linting, building, testing, and deployment of the Docker container directly to the host.
4. **Observability:** Prometheus scrapes system metrics, which are then visualized through interactive Grafana dashboards.

## Technologies Used
* **Cloud Provider:** AWS (EC2, VPC, Security Groups)
* **IaC:** Terraform
* **CI/CD:** Jenkins
* **Containerization:** Docker
* **Web Server:** Nginx (Alpine)
* **Monitoring:** Prometheus & Grafana
* **Frontend:** HTML

##  Repository Structure
├── terraform/
│   ├── main.tf              # AWS provider and EC2 instance configuration
│   ├── vpc.tf               # Networking components (VPC, Subnet, IGW)
│   └── outputs.tf           # Terraform outputs (Public IP)
├── Dockerfile               # Instructions to build the Nginx web image
├── Jenkinsfile              # Declarative CI/CD pipeline stages
├── index.html               # Custom website source code
└── README.md
