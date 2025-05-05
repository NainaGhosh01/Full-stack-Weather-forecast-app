# 🌤️ Weather Forecast Web App - Full AWS DevOps Automation

This is a **Flask-based Weather Forecast Web Application** deployed automatically to **Azure App Service** using **Terraform** and **GitHub Actions**. It includes containerized deployment with Docker, secrets managed via GitHub, and full infrastructure as code setup.

---

## 🎯 Objective

To build and deploy a simple, responsive weather forecast web app on Microsoft Azure using automation-first principles:

- Use **Docker** to containerize the app
- Use **Terraform** to define and deploy Azure infrastructure
- Use **GitHub Actions** for full CI/CD pipeline
- Keep the system scalable, repeatable, and cloud-native

---

## 🔧 Tech Stack

- **Frontend/Backend**: Flask (Python)
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **CI/CD**: GitHub Actions
- **Cloud Platform**: Microsoft Azure (App Service)
- **Secrets**: GitHub Secrets 

---

---

## 🚀 Features

- ✅ Clean and simple UI to fetch live weather
- ✅ Flask backend with API consumption from OpenWeatherMap
- ✅ Dockerized app for platform independence 
- ✅ Infrastructure provisioned with Terraform
- ✅ GitHub Actions workflow for full automation 
- ✅ Output the **live app URL** after deployment
- ✅ Secure secret handling using GitHub Secrets
- ✅ No local installation required!

---

---

## ⚙️ How It Works

1. Code is pushed to main → triggers GitHub Actions.
2. Docker image is built and pushed to GitHub Container Registry (GHCR).
3. Terraform creates Azure resources: Resource Group, App Service Plan, Web App.
4. Azure Web App pulls the container and runs the Flask app.
5. GitHub Actions outputs the live app URL.

---


