# 🌤️ Weather Forecast Web App - Full AWS DevOps Automation

This project is a full-stack **Weather Forecast Web Application** deployed on **AWS EKS** using Terraform and GitHub Actions. It includes CI/CD pipelines, monitoring, and an ETL component to store weather data in S3.

---

## 🔧 Tech Stack

- **Frontend/Backend**: Flask (Python)
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **CI/CD**: GitHub Actions
- **Orchestration**: Kubernetes on AWS EKS
- **Monitoring**: Prometheus + Grafana via Helm
- **ETL**: Python script → Weather API → AWS S3

---

---

## 🚀 Features

- ✅ Infrastructure provisioning using Terraform (EKS, VPC, IAM, ECR)
- ✅ CI/CD with GitHub Actions
- ✅ Monitoring with Prometheus + Grafana (via Helm)
- ✅ ETL script runs automatically and uploads weather data to S3
- ✅ S3 bucket and IAM role fully managed via Terraform
- ✅ Secure GitHub OIDC setup (no long-term AWS credentials)

---

---

## ⚙️ How It Works

1. **Push to `main`** triggers Terraform infra setup
2. Docker image is built → pushed to **ECR**
3. App is deployed to **EKS cluster**
4. Prometheus & Grafana are installed
5. **ETL job** fetches live weather data → uploads CSV to **S3**
6. Monitoring + logs + metrics in place!

---


