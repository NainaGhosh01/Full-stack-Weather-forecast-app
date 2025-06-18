# 🌤️ Weather Forecast Web App - Full Azure DevOps Automation

This is a **Flask-based Weather Forecast Web Application** deployed automatically to **Azure App Service** using **Terraform** and **GitHub Actions**. It includes containerized deployment with Docker, secrets managed via GitHub, and full infrastructure as code setup.

---

---

## 🎯 Objective

To build and deploy a simple, responsive weather forecast web app on Microsoft Azure using automation-first principles:

- Use **Docker** to containerize the app
- Use **Terraform** to define and deploy Azure infrastructure
- Use **GitHub Actions** for full CI/CD pipeline
- Keep the system scalable, repeatable, and cloud-native

---

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

- ✅ CI/CD pipeline with GitHub Actions to automate the build, push, and deployment of Docker images to Azure.
- ✅ Docker Hub used for storing and pulling container images.
- ✅ Azure App Service to deploy and host the weather app in a container.
- ✅ Terraform used for provisioning Azure resources like the Resource Group, App Service Plan, and App Service.
- ✅ Output the **live app URL** after deployment
- ✅ Weather API Integration to get live weather data for any city.

---

---

## ⚙️ How It Works

1. Code is pushed to main → triggers GitHub Actions.
2. Docker image is built and pushed to Dockerhub.
3. Terraform creates Azure resources: Resource Group, App Service Plan, Web App.
4. Azure Web App pulls the container and runs the Flask app.
5. GitHub Actions outputs the live app URL.

---

---

## 🤖 Conclusion

This project demonstrates how to:

- Containerize a Flask web app using Docker.
- Push the image to Docker Hub.
- Automate the deployment to Azure App Service using GitHub Actions and Terraform.

---


