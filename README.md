# End-to-End Web Deployment with CI/CD & Multi-Layer Monitoring

## Overview
This project demonstrates a complete DevOps lifecycle for a custom HTML application. It features automated infrastructure provisioning, a self-triggering CI/CD pipeline, and a deep-visibility monitoring stack (Node Exporter + cAdvisor) to track both server and container health.

## Architecture & Workflow
1.  **Infrastructure:** AWS resources (VPC, EC2, Security Groups) provisioned via **Terraform**.
2.  **CI/CD Trigger:** A **GitHub Webhook** is configured to detect code pushes, automatically triggering the Jenkins build.
3.  **Pipeline:** **Jenkins** pulls the private repo, builds a **Docker** image, and deploys it to the host on Port 4000.
4.  **Monitoring:** A **Docker Compose** stack runs Prometheus, Node Exporter, and cAdvisor to gather real-time metrics.
5.  **Visualization:** **Grafana** connects to Prometheus to display hardware and container-level dashboards.

## Monitoring Stack Details
We use a "Three-Tier" monitoring approach to ensure 100% visibility:
* **Prometheus:** The central time-series database that scrapes all metrics.
* **Node Exporter:** Captures OS-level metrics (CPU, RAM, Disk, Network) from the EC2 host.
* **cAdvisor (Container Advisor):** Specifically monitors Docker containers, providing labels to filter metrics by container name (`web-container`) or image.
* **Grafana:** Centralized dashboard for visualizing hardware health and Docker resource consumption.

## 📂 Repository Structure
```text
├── terraform/           # Infrastructure as Code (VPC, EC2, SG)
├── docker-compose.yml   # Monitoring stack (Prometheus, Exporters)
├── Dockerfile           # Nginx-based image for the HTML app
├── Jenkinsfile          # Pipeline-as-Code for automated deployment
├── index.html           # Custom Website Source
└── README.md

** Future enhancements **
-- **Container Registry** : Move from local Docker images to Amazon ECR (Elastic Container Registry) for better versioning and security.
-- **High Availability** : Implement an Nginx Reverse Proxy or AWS ALB (Application Load Balancer) to handle traffic and SSL termination.
-- **Hardened Security** : Restrict AWS Security Groups to allow inbound traffic only from a Personal IP (My IP) rather than leaving Port 4000 open to 0.0.0.0/0.
-- **Orchestration** : Migrate the standalone Docker deployment to Amazon ECS or Kubernetes (EKS).

<img width="1920" height="1034" alt="{033B9904-26E4-49BB-A4D1-6BA27FBFBE45}" src="https://github.com/user-attachments/assets/c77ece96-fad7-4338-a39a-b751883bb5ad" />

<img width="1920" height="1031" alt="{7C2A7E64-9035-4F24-B512-AAEA016EF825}" src="https://github.com/user-attachments/assets/e452f695-db58-4889-aa8c-5a1ebbb84006" />
