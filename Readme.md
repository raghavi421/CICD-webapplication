                                                   **CI/CD Pipeline for Dockerized Web Application**

**Project Overview:**
This project demonstrates a complete CI/CD pipeline for a 2-tier web application using Docker, Docker Compose, and GitHub Actions. The pipeline automatically builds, tests, scans, pushes, and deploys the application to a staging environment.

**Architecture Overview:**
Application Architecture 
* Frontend: Static web application served via NGINX
* Backend: Python Flask API
* Database: PostgreSQL

**Infrastructure Components:**
* Docker (containerization)
* Docker Compose (local & staging orchestration)
* GitHub Actions (CI/CD)
* Docker Hub (image registry)

**Architecture Diagram**
User
|
v
Frontend 
|
v
Backend (Flask API)
|
v
PostgreSQL Database

**Project Structure**
CICD-WEBAPPLICATION/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── backend/
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
│
├── frontend/
│   ├── Dockerfile
│   └── index.html
│
├── scripts/
│   ├── deploy.sh
│   └── verify.sh
│
├── .env
│
├── docker-compose.yml
├── docker-compose-staging.yml
│
├── README.md


**Docker Implementation**
Backend Dockerfile
* Multi-stage build
* Slim base image
* Non-root user
* Layer caching

**Frontend Dockerfile**
* NGINX Alpine image
* Static content served efficiently

**Image Optimization**
image               	Before	     After
Backend	              ~900MB	    ~120MB
Frontend	            ~150MB	    ~25MB

**Docker Compose**
Local Development
  *docker-compose up --build
Staging Environment
   *docker compose -f docker-compose.staging.yml up -d

**CI/CD Pipeline (GitHub Actions)**
    Pipeline Trigger
      Triggered on push to main branch
**Pipeline Stages**
Checkout Code
Build Docker Images
Run Unit Tests Inside Containers
Security Scan with Trivy
Tag & Push Images to Docker Hub
Deploy to Staging Environment
**Secrets Management**
GitHub Secrets used:
* DOCKER_USERNAME
* DOCKER_PASSWORD
Secrets are never hardcoded in the repository.

**Deployment Process (Staging):**

Pull latest images from Docker Hub
Stop old containers
Start new containers
Run database migrations (if any)
Perform health check
Health Endpoint:
 GET /health
**Verification**
Backend Health: http://localhost:5000/health
Frontend: http://localhost:8080

**Deployment Script**
#!/bin/bash
docker pull yourdockerhub/backend:staging
docker pull yourdockerhub/frontend:staging
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d
