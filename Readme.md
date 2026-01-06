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
CICD-webapplication/
├── backend/
│ ├── app.py
│ ├── requirements.txt
│ └── Dockerfile
│
├── frontend/
│ ├── index.html
│ └── Dockerfile
│
├── docker-compose.yml
├── docker-compose.staging.yml
├── .env.staging
│
├── .github/
│ └── workflows/
│ └── ci-cd.yml
│
├── scripts/
└── README.md

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
